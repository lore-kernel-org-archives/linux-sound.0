Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18653B8D48;
	Mon, 30 Mar 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774865784; cv=none; b=VeZYJhdWItUH7keDKpe9OIDt959pPEc2u2z/6hWADDA2Ove4CrCp34ldaVIj1Lwr5JVa09lc5MtuJN3UWj2fXr1/l9YDmSkcLtvF+Ipg1kW0jMtbNaJKlyEb3+n9KpGq4Y1uy2fOx22VDlG0hiKT+z3xUXTw7irm8o3K4UhBArM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774865784; c=relaxed/simple;
	bh=7KKTvcZcMV/A1vHfqktVWzypo7vSvF011WDH/qo4T/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AG74nuelfVTgE+RkPeQIirS726mLRG2CAmtgcZZtZtg9WG2Bmqbv5gVDh5wWOMdwiYfK2jJmagU4FDlZ5tpizzdLpFmVWGaQeAAKCyqLO44MZsAIduqSkSEnXOM3wx0ZjPVTD4MpWqijpsB2KGdSC4zY6WkOxEZoS03rgyP6Eik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qkEs735Z; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qkEs735Z"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 74AB54E42869;
	Mon, 30 Mar 2026 10:16:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3E9AE5FFA8;
	Mon, 30 Mar 2026 10:16:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC3F110450F14;
	Mon, 30 Mar 2026 12:16:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774865780; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=jSr+qiZSp3u5YVngTgqtKy54G7uJpnLiCgqcSG9ifqI=;
	b=qkEs735Z4mx4toJSZEIhr4Cm2syqUpXUZlnjV2Hsd65IKdq9eiPODCLeaESxv1yqrD6tNk
	7likJAxIQpACSkhP8uIDabDowbGxD4ZckUs0CM7On9EqIaal7VykrTi0q5xRXebG7OvaJi
	WVeINT4k/kbtYr0rQ4/Skt8qDpE8y4dBDZsn5uIC0kdYkuGcL/o5MT4pP2lR35SaDXOW5c
	YuHWlekWm0zRij9AGf3PqtDpmkzVr5UL+tes700qNHUpzCcdk/rnisK06P1dzup5zY3oFm
	wMyGtMSG2X8Zla4JS/1bkSPOnm1FV5mRy0rMNIqcSCq0vPibUOZAhEAM6lTQuw==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH 1/4] of: Introduce of_property_read_s32_index()
Date: Mon, 30 Mar 2026 12:16:05 +0200
Message-ID: <20260330101610.57942-2-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330101610.57942-1-herve.codina@bootlin.com>
References: <20260330101610.57942-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Signed integers can be read from single value properties using
of_property_read_s32() but nothing exist to read signed integers
from multi-value properties.

Fix this lack adding of_property_read_s32_index().

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 include/linux/of.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/linux/of.h b/include/linux/of.h
index be6ec4916adf..526c1ee819cd 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1457,6 +1457,13 @@ static inline int of_property_read_s32(const struct device_node *np,
 	return of_property_read_u32(np, propname, (u32*) out_value);
 }
 
+static inline int of_property_read_s32_index(const struct device_node *np,
+					     const char *propname, u32 index,
+					     s32 *out_value)
+{
+	return of_property_read_u32_index(np, propname, index, (u32 *)out_value);
+}
+
 #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
 	for (of_phandle_iterator_init((it), (np), (ln), (cn), (cc)),	\
 	     err = of_phandle_iterator_next(it);			\
-- 
2.53.0

