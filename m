Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AF43A9DB2;
	Sun, 24 May 2026 16:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779641639; cv=none; b=X5zU3js7EFFtF2J55rwSB5Dfah8dY6xqYHojIAVd/LppiXLFmKwOzPzoCNstotilatgRYvVzRBVQhx4/+rux+WhsTSLiCTEo2Ze+r7gi80j/KSGa9Xqzou3Psb12vJYIaeyPPOx+5Hb9tTCI3lbDcNe9SEVjF86puNMXDcSt8ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779641639; c=relaxed/simple;
	bh=KTHpF5bJe6Jfdej78toqBd9g7kytJ1PMa3uVmAMc8xU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i1MZHUkxTO88Ndko1kkyVi4iHdEu2LgdvlHltQmYHUWFzvasGHqfLbEnos1wLI1m+WO3z+gxcvjNSJ/7ljDRtzOGBBsktHgu4o39z8QQLtv8dhgREbSvPDBegCCRPJF40Ir/dpcMRnOEWFJc3565c7D70NrudWDM6cmZLjEFAaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b=SZPnNua+; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=len.bao@gmx.us header.b="SZPnNua+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1779641631; x=1780246431; i=len.bao@gmx.us;
	bh=18onRjYpHFpRRRhSIIaUAssQZLSeSGdrsSj0i1VGrBo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SZPnNua+dzDuY0zcL/QJCqajVgmsGEjqcsbHs5mZxZfLQ2TKzgbiuEXXWRGKeohp
	 ziIEWdGazAsPRI5he3FffU3ruoIaplG9N/kOgJefn8ZS1cy7Jr+4PDkI/H0qHBvZv
	 MPlla4PMEqWbmIdx8vSwrvm4x7tD/uUZUyhNZKiNwxdmMkSqADmG36lGL69BmZfJP
	 lmS1WwF+UHIUw/nve7f5ltYNXyR2twML5m8dgh3TZzisQ13Wmas+ImgWH8sjOtmAs
	 tv7+188Bud+WDVX91FhqOyk52eEGXU0wirKLlJoBeJwYh3Gzm10BNsu+CwE2sM+bg
	 xLhDIysCduwoMECJvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MBUqL-1wcQEK1Hax-00GFcn; Sun, 24
 May 2026 18:53:51 +0200
From: Len Bao <len.bao@gmx.us>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Cc: Len Bao <len.bao@gmx.us>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: drivers: Mark some variables as __ro_after_init
Date: Sun, 24 May 2026 16:52:48 +0000
Message-ID: <20260524165249.48941-1-len.bao@gmx.us>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:KNabKe9FnY+lIzKVG5Ym5XchKg1fVodXq/LBpSg1vmsLBn5psIs
 S9ZptPE/0M5n/FQfbakGuS63zfmd9SZ/Mps2wsWT+Oirr1i+C9Bvwnp6ZFB7F2z/qGHzBeR
 HFz+Mza1o5N8WKRY0sl1kKdK1T/blQeMAIRxPKrugE6VZ2OqWL2LlT6YesH3YHZ/hXXafIM
 +eLFwbf1oEg2ERKR8dBWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fdpUVKN5Z24=;HWNyKYlh2KOJcCxbM2q3AWlqWCT
 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
 qOEOmrMyYuwlpHYhVz3el/fPoWEl/rygtZDqJEu

Some variables in the 'ALSA/drivers' are initialized only during the
init phase in the '__init' functions and never changed. So, mark them
as __ro_after_init to reduce the attack surface.

Signed-off-by: Len Bao <len.bao@gmx.us>
=2D--
 sound/drivers/mpu401/mpu401.c | 2 +-
 sound/drivers/pcmtest.c       | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/drivers/mpu401/mpu401.c b/sound/drivers/mpu401/mpu401.c
index d3f942408..b615a310c 100644
=2D-- a/sound/drivers/mpu401/mpu401.c
+++ b/sound/drivers/mpu401/mpu401.c
@@ -46,7 +46,7 @@ module_param_array(uart_enter, bool, NULL, 0444);
 MODULE_PARM_DESC(uart_enter, "Issue UART_ENTER command at open.");
=20
 static struct platform_device *platform_devices[SNDRV_CARDS];
-static int pnp_registered;
+static int pnp_registered __ro_after_init;
 static unsigned int snd_mpu401_devices;
=20
 static int snd_mpu401_create(struct device *devptr, int dev,
diff --git a/sound/drivers/pcmtest.c b/sound/drivers/pcmtest.c
index 7f93557b5..5d5281e4d 100644
=2D-- a/sound/drivers/pcmtest.c
+++ b/sound/drivers/pcmtest.c
@@ -113,7 +113,7 @@ struct pcmtst_buf_iter {
 	struct timer_list timer_instance;
 };
=20
-static struct snd_pcm_hardware snd_pcmtst_hw =3D {
+static struct snd_pcm_hardware snd_pcmtst_hw __ro_after_init =3D {
 	.info =3D (SNDRV_PCM_INFO_INTERLEAVED |
 		 SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		 SNDRV_PCM_INFO_NONINTERLEAVED |
@@ -137,7 +137,7 @@ struct pattern_buf {
 	u32 len;
 };
=20
-static int buf_allocated;
+static int buf_allocated __ro_after_init;
 static struct pattern_buf patt_bufs[MAX_CHANNELS_NUM];
=20
 static inline void inc_buf_pos(struct pcmtst_buf_iter *v_iter, size_t by,=
 size_t bytes)
=2D-=20
2.43.0

