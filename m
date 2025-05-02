Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99D23A9A7
	for <linux-sound@vger.kernel.org>; Fri,  2 May 2025 10:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180856; cv=none; b=Iwid4JansiNeubD02KVyypOvp1LA0edu0Jf7WEW5GGnZ+YcpGbg/75pgns7/QpyN9YCawlvEengGOhYiFWY0nQ16+pTd74A194k+h2gC8cE275HWDSXtYSjz1wCiVE8P8776uwuJWPwvG2gelw0EYcbGOyNaulaChGTPMZsriLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180856; c=relaxed/simple;
	bh=/SrYROoHwClXlLK/3V8eP3sX5TC6HBBISCWpIYnRIGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kqYuE2HXeu7M1uEBsbsT0pdPcvC7TELx7lszABfIL+1GEzdnctAssUqLViDRzADqe8+hb8mnFfW/WG9xBFONhVoMihYYa0hzszdv0puLfd/j+ASb/Sff4aek8zK9yj3LtEHfrILmlH6CLvgZxpNfgdhbOmJ2qqgp+Tjc5bldbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:df64:35e8:502:4ac0])
	by baptiste.telenet-ops.be with cmsmtp
	id kAE02E00f4sst1101AE0qJ; Fri, 02 May 2025 12:14:00 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP2-00000000WAO-0n9r;
	Fri, 02 May 2025 12:14:00 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1uAnP6-00000008oXX-2ecS;
	Fri, 02 May 2025 12:14:00 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Cc: linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 18/22] spi: sh-msiof: Simplify BRG's Division Ratio
Date: Fri,  2 May 2025 12:13:50 +0200
Message-ID: <6c1085baffbdaab09115372c40a0072c5927be7a.1746180072.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1746180072.git.geert+renesas@glider.be>
References: <cover.1746180072.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As FIELD_PREP() masks the value to be stored in the field, the Baud Rate
Generator's Division Ratio handling can be simplified from a look-up
table to a single subtraction.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Gcc 13.3.0 is not smart enough to consider all possible values of
div_pow in the current code, hence this works fine.
However, the simpler test loop

    for (unsigned int pow = 0; pow < 6; pow++)
	    pr_info("pow %u scr 0x%08lx\n", pow,
		    FIELD_PREP(SISCR_BRDV, (pow - 1)));

does trigger a "FIELD_PREP: value too large for the field" compile-time
assertion, unless an explicit "& FIELD_MAX(SISCR_BRDV)" is added.
Should we be pro-active and add an extra "& FIELD_MAX(SISCR_BRDV)" now,
to prepare for compilers becoming smarter?
---
 drivers/spi/spi-sh-msiof.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-sh-msiof.c b/drivers/spi/spi-sh-msiof.c
index 26e71fc8890fda6d..2b8c143b21219521 100644
--- a/drivers/spi/spi-sh-msiof.c
+++ b/drivers/spi/spi-sh-msiof.c
@@ -112,12 +112,6 @@ struct sh_msiof_spi_priv {
 /* SITSCR and SIRSCR */
 #define SISCR_BRPS		GENMASK(12, 8)	/* Prescaler Setting (1-32) */
 #define SISCR_BRDV		GENMASK(2, 0)	/* Baud Rate Generator's Division Ratio */
-#define SISCR_BRDV_DIV_2	0U
-#define SISCR_BRDV_DIV_4	1U
-#define SISCR_BRDV_DIV_8	2U
-#define SISCR_BRDV_DIV_16	3U
-#define SISCR_BRDV_DIV_32	4U
-#define SISCR_BRDV_DIV_1	7U
 
 /* SICTR */
 #define SICTR_TSCKIZ		GENMASK(31, 30)	/* Transmit Clock I/O Polarity Select */
@@ -256,11 +250,6 @@ static void sh_msiof_spi_reset_regs(struct sh_msiof_spi_priv *p)
 				  100);
 }
 
-static const u32 sh_msiof_spi_div_array[] = {
-	SISCR_BRDV_DIV_1, SISCR_BRDV_DIV_2, SISCR_BRDV_DIV_4,
-	SISCR_BRDV_DIV_8, SISCR_BRDV_DIV_16, SISCR_BRDV_DIV_32,
-};
-
 static void sh_msiof_spi_set_clk_regs(struct sh_msiof_spi_priv *p,
 				      struct spi_transfer *t)
 {
@@ -299,7 +288,8 @@ static void sh_msiof_spi_set_clk_regs(struct sh_msiof_spi_priv *p,
 
 	t->effective_speed_hz = parent_rate / (brps << div_pow);
 
-	scr = FIELD_PREP(SISCR_BRDV, sh_msiof_spi_div_array[div_pow]) |
+	/* div_pow == 0 maps to SISCR_BRDV_DIV_1 == all ones */
+	scr = FIELD_PREP(SISCR_BRDV, div_pow - 1) |
 	      FIELD_PREP(SISCR_BRPS, brps - 1);
 	sh_msiof_write(p, SITSCR, scr);
 	if (!(p->ctlr->flags & SPI_CONTROLLER_MUST_TX))
-- 
2.43.0

