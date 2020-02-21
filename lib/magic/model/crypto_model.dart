
class Crypto {
    final String id;
    final String name;
    final String symbol;
    final String rank;
    final String priceUsd;
    final String priceBtc;
    final String the24HVolumeUsd;
    final String marketCapUsd;
    final String availableSupply;
    final String totalSupply;
    final String maxSupply;
    final String percentChange1H;
    final String percentChange24H;
    final String percentChange7D;
    final String lastUpdated;

    Crypto({
        this.id,
        this.name,
        this.symbol,
        this.rank,
        this.priceUsd,
        this.priceBtc,
        this.the24HVolumeUsd,
        this.marketCapUsd,
        this.availableSupply,
        this.totalSupply,
        this.maxSupply,
        this.percentChange1H,
        this.percentChange24H,
        this.percentChange7D,
        this.lastUpdated,
    });

    factory Crypto.fromJson(Map<String, dynamic> json) => Crypto(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        symbol: json["symbol"] == null ? null : json["symbol"],
        rank: json["rank"] == null ? null : json["rank"],
        priceUsd: json["price_usd"] == null ? null : json["price_usd"],
        priceBtc: json["price_btc"] == null ? null : json["price_btc"],
        the24HVolumeUsd: json["24h_volume_usd"] == null ? null : json["24h_volume_usd"],
        marketCapUsd: json["market_cap_usd"] == null ? null : json["market_cap_usd"],
        availableSupply: json["available_supply"] == null ? null : json["available_supply"],
        totalSupply: json["total_supply"] == null ? null : json["total_supply"],
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        percentChange1H: json["percent_change_1h"] == null ? null : json["percent_change_1h"],
        percentChange24H: json["percent_change_24h"] == null ? null : json["percent_change_24h"],
        percentChange7D: json["percent_change_7d"] == null ? null : json["percent_change_7d"],
        lastUpdated: json["last_updated"] == null ? null : json["last_updated"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "symbol": symbol == null ? null : symbol,
        "rank": rank == null ? null : rank,
        "price_usd": priceUsd == null ? null : priceUsd,
        "price_btc": priceBtc == null ? null : priceBtc,
        "24h_volume_usd": the24HVolumeUsd == null ? null : the24HVolumeUsd,
        "market_cap_usd": marketCapUsd == null ? null : marketCapUsd,
        "available_supply": availableSupply == null ? null : availableSupply,
        "total_supply": totalSupply == null ? null : totalSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "percent_change_1h": percentChange1H == null ? null : percentChange1H,
        "percent_change_24h": percentChange24H == null ? null : percentChange24H,
        "percent_change_7d": percentChange7D == null ? null : percentChange7D,
        "last_updated": lastUpdated == null ? null : lastUpdated,
    };
}
