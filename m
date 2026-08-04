Received: from n169-111.mail.139.com (n169-111.mail.139.com [120.232.169.111])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB2CF4A35;
	Tue,  4 Aug 2026 12:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847224; cv=none; b=oMuNNbCNLYT+ATyDIP3BuovG2ikTIsT+3kHNqijh2cGNmspIF3/Ul5FUDAYtvHk5lF4p3OO0vpUKeaXEFs4snIKrMwyJL/RZATrL/4wNBXee879PJj9witPsjZj9FaeKN+/hXI/qjaO1C647dZTS1qCUIaFmumcwUsKyHY0pbfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847224; c=relaxed/simple;
	bh=N207eohR/z2VbwZlZKQiZI6GuXMpI81K05x12Rb/yHk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n0LlGLKPpoHgLK9ZmzluN9NvPbiMBmPBHHpLgen0LEWwlitn1PRlqylKOL0HzSL+2h6Yaff8I4SDFvSm4zm/wSRH3b9evYwhHyMt2IPu33Y3afXEmaQrxAeozUlD0Os5Oaifnj6QoBWp5kyP88ox07J2Rqn5rl/OwAHFtk4KDps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b=Hajtu/42; arc=none smtp.client-ip=120.232.169.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=139.com header.i=@139.com header.b="Hajtu/42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=139.com; s=dkim; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=Hajtu/42krpFraqw0GechpFkxGVXCWqCJlmumk8WypESntkj8/5UGKgSEH5agnDuehCw4GpXrvJIp
	 nY64o5Q+avxoUmr0/rBdagyEIzyXCbHrg2YvT+fLGOZkr+jgYz2dvu2PWEoUVJO/be59Xlk1rR/yB3
	 /ucV6Vm8gXh7oDfc=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000005
Received:from ud26-Legion-7-15ASH11 (unknown[240E:404:B721:7788:8AF2:1876:EB41:E20F])
	by rmsmtp-lg-appmail-17-12016 (RichMail) with SMTP id 2ef06a71dcdbac5-01ae8;
	Tue, 04 Aug 2026 20:36:56 +0800 (CST)
X-RM-TRANSID:2ef06a71dcdbac5-01ae8
From: Jackie Dong <xy-jackie@139.com>
To: perex@perex.cz,
	tiwai@suse.com,
	zhangheng@kylinos.cn,
	kailang@realtek.com,
	damien.dagorn29@gmail.com,
	sean@starlabs.systems,
	chris.chiu@canonical.com,
	huanglei@kylinos.cn,
	dnaim@cachyos.org
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jackie Dong <xy-jackie@139.com>
Subject: [PATCH] ALSA:hda/realtek:ALC269 fixup for Yoga/Legion Mic noise
Date: Tue,  4 Aug 2026 20:36:37 +0800
Message-ID: <20260804123637.21001-1-xy-jackie@139.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lenovo Yoga Pro 7 15ASH11 and Legion 7 15ASH11 use the same audio
subsystem implementation and support only analog microphone.

Limit Amp-In Vals to 0x00 and 0x01 for the internal microphone to reduce
recording noise. Values 0x02 and 0x03 introduce significant noise on
them.

Signed-off-by: Jackie Dong <xy-jackie@139.com>
---
 sound/hda/codecs/realtek/alc269.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 48a2e7f2ebb1..9ac9971d7873 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -3524,6 +3524,16 @@ static void alc287_fixup_yoga9_14iap7_bass_spk_pin(struct hda_codec *codec,
 	}
 }
 
+static void alc_fixup_yoga_pro7_audio(struct hda_codec *codec,
+				      const struct hda_fixup *fix, int action)
+{
+	/* Reuse the DAC routing selected for ThinkPad X1 Gen7 */
+	alc285_fixup_thinkpad_x1_gen7(codec, fix, action);
+
+	/* Limit the internal mic boost to 0 or 1 to avoid noise */
+	alc269_fixup_limit_int_mic_boost(codec, fix, action);
+}
+
 static void alc295_fixup_dell_inspiron_top_speakers(struct hda_codec *codec,
 					  const struct hda_fixup *fix, int action)
 {
@@ -6209,8 +6219,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
 		.type = HDA_FIXUP_FUNC,
-		/* Reuse the DAC routing selected for ThinkPad X1 Gen7 */
-		.v.func = alc285_fixup_thinkpad_x1_gen7,
+		.v.func = alc_fixup_yoga_pro7_audio,
 		.chained = true,
 		.chain_id = ALC269_FIXUP_LENOVO_XPAD_ACPI,
 	},
-- 
2.53.0


