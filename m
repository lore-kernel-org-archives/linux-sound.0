Received: from cantor.telenet-ops.be (cantor.telenet-ops.be [195.130.132.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74EDD1494DB
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402368; cv=none; b=MXESiu1mzOhW9pgyfAJhTyZvP3VsOl7F9XfQje0hFzL7oyskWQ79FFdXzKd9ECFKhar6jWZQjaymUIt9lcPrPr16OHXTggFKhlwF19faH3YY5VZgclENdjGxVeAdmxpUI9pwc5baXijqcV3V5i1a6rHxrfnJ/6/g34w2IprG7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402368; c=relaxed/simple;
	bh=mvpjcX/5a0oFb846ghe+MQ7JRUNpQqkMZ0y8uI1l3Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+cEgmLw9OaTEJdTo5qj1T9819Cgkminv1/a7+Fo+0IH4jhiKmEdSOILrggW0P+3MAQsaiSSB0N0spzd9KN49D2ub69v0zRfoDRLrpZHzO1xaSvckKrD2Vaedrli8MQoMNm1VXzKV9wlkkG1xtNJAje7YkTowBI7GvPxddRvciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by cantor.telenet-ops.be (Postfix) with ESMTPS id 4ZzSgP4BMbz4xBbS
	for <linux-sound@vger.kernel.org>; Fri, 16 May 2025 15:32:33 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b0d6:ccd4:58dc:70fd])
	by albert.telenet-ops.be with cmsmtp
	id ppYX2E00B3S8nz406pYXww; Fri, 16 May 2025 15:32:33 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAi-000000020iV-11f3;
	Fri, 16 May 2025 15:32:31 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uFvAt-0000000152L-2erg;
	Fri, 16 May 2025 15:32:31 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 05/22] spi: sh-msiof: Use bool for boolean flags
Date: Fri, 16 May 2025 15:32:08 +0200
Message-ID: <35cd51bdfb3c810911a5be757e0ce5bb29dcc755.1747401908.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747401908.git.geert+renesas@glider.be>
References: <cover.1747401908.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use bools instead of integers for boolean flags, which allows us to
remove the "!!" idiom from several expressions.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/spi/spi-sh-msiof.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 367622985fea2a04..11ef5c0a498d7c1f 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -348,11 +348,11 @@ static u32 sh_msiof_spi_get_dtdl_and_syncdl(struct sh_msiof_spi_priv *p)
 }
 
 static void sh_msiof_spi_set_pin_regs(struct sh_msiof_spi_priv *p, u32 ss,
-				      u32 cpol, u32 cpha,
-				      u32 tx_hi_z, u32 lsb_first, u32 cs_high)
+				      bool cpol, bool cpha, bool tx_hi_z,
+				      bool lsb_first, bool cs_high)
 {
+	bool edge;
 	u32 tmp;
-	int edge;
 
 	/*
 	 * CPOL CPHA     TSCKIZ RSCKIZ TEDG REDG
@@ -587,7 +587,8 @@ static int sh_msiof_prepare_message(struct spi_controller *ctlr,
 {
 	struct sh_msiof_spi_priv *p = spi_controller_get_devdata(ctlr);
 	const struct spi_device *spi = msg->spi;
-	u32 ss, cs_high;
+	bool cs_high;
+	u32 ss;
 
 	/* Configure pins before asserting CS */
 	if (spi_get_csgpiod(spi, 0)) {
@@ -595,12 +596,11 @@ static int sh_msiof_prepare_message(struct spi_controller *ctlr,
 		cs_high = p->native_cs_high;
 	} else {
 		ss = spi_get_chipselect(spi, 0);
-		cs_high = !!(spi->mode & SPI_CS_HIGH);
+		cs_high = spi->mode & SPI_CS_HIGH;
 	}
-	sh_msiof_spi_set_pin_regs(p, ss, !!(spi->mode & SPI_CPOL),
-				  !!(spi->mode & SPI_CPHA),
-				  !!(spi->mode & SPI_3WIRE),
-				  !!(spi->mode & SPI_LSB_FIRST), cs_high);
+	sh_msiof_spi_set_pin_regs(p, ss, spi->mode & SPI_CPOL,
+				  spi->mode & SPI_CPHA, spi->mode & SPI_3WIRE,
+				  spi->mode & SPI_LSB_FIRST, cs_high);
 	return 0;
 }
 
-- 
2.43.0

