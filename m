Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F953128A3
	for <linux-sound@vger.kernel.org>; Sat, 28 Mar 2026 04:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774673626; cv=none; b=UcNna7juP2mFUzL8Lc/A9aCMtzvL8DwdgI7MwJ13nmPV12ilAe5E1DM2FXBpiXvcQZ+SjvZs/Nb3ZgWgfWGfSPCkQ2rED7WkwO/gM3XxeeCJEUSYA0Y24GoMlFoyc5ouRiFvQsdxRA8VXYGUY4bB2Cn1UCq61SqlKYPgTipYkg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774673626; c=relaxed/simple;
	bh=zUUT8ULAWNosXjYUL6tV4aiDqB1v42lE04t7YEhqVDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aWiYAAiypvBev4pJao0dY5idszEH+x85vS15lT6sZCyeKPlEk6AKFu6E/JbeSgq6t5nwpFOhamNwZz6l90dDo5DpZUxSQdythEItwEG1UaadAKUWwpRtkQcF9WwUdYfyHYveD/fZ6VgieFsKSgWyc4DEYYlzN+GYUKMLzWRnVtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZgCfcF3; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZgCfcF3"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c15849aa2cso3134367eec.0
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 21:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774673624; x=1775278424; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q1sOfaLhztum4unJqG+/ZJIMHXn2G0D6GNK5mWedLkA=;
        b=CZgCfcF31Va+EQa88Ayme3Ow229hDb4bZTWmJwVNxaKzzrMzKbpVS+tVYWOZI3SnBq
         IUUtlKuq4MuiikCIF9YkKkenKM5Z58inT5egTVukWSrqyvpky0zlLY6n64jwsRCuV1xL
         xmY4pPRMVhAYB2sfvCPyTh3IiN4jhGDKcqsz9QjV0+PhLJdCAK5+qg39NhvtXeARkrP7
         Aaox/yG4QfkJylxt5SSl7nalWZunBTNeJpalJr6+XufdIbaqZTkxbchr49/hy/JiRZbu
         WTdzUfOWV62UZj9P3hsjTtgS/ONsaegAcbZby8Icj6/dhke+4DT5xUlg3uWnvFFFE6tx
         6+XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774673624; x=1775278424;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1sOfaLhztum4unJqG+/ZJIMHXn2G0D6GNK5mWedLkA=;
        b=OyIG8x+y978LtvkS5y3EdVhbLNrR2hZ6+jtbFRe9/ZdYeYll/uxueQfms8GRryv8tV
         Uyhu5CIQ5Mq9bDzhfP3mGhlacMd2hR8Jvn04WSGCYDFAuOeBBDIJc4rZt22EsnOt2X8L
         NVKsSavx3cUYAPOSJtTr1Bb2QYs6Ct9Z/Ok/MFcA6pN7se+EPyirtHy2Sc3RWbcss9WD
         h7VPW306dJrkydwT95R4x08CMKjtqhgnUlTVI0kun4HEfgJAtcydRbXcOeE19nWEbQjT
         tEirm7oMMTC/fAdZ1JYAcT9X4d0x1c1BvMNXWNFBP0HD41gxw65wMLLrHfRTWrANuKbB
         ccIQ==
X-Gm-Message-State: AOJu0YyZGa5Wfp5ltN7+7TN+gkWs1GtHWwoyz8DhqK8Z+y8nbWWwW2XP
	iJmBct1MrtUkH06RlojhFIdy58FEkqx3y0zawXl1A/7Em7cmmUPbmHsx
X-Gm-Gg: ATEYQzxtHEmrqCtI43YaCrkpuySTwW+FpF7DP4UCwGlEWUvOm+D8VhwQ5Yhlif5FINB
	PR7B4CWrvAiAa3NFEiMQxrD7mVHa1MRbV6ESjaiFMwkgtmYzq1l629sShHiTZIz7pj8yA7RokwN
	VZOU2M0R4dyprwKUKrxrSSfW6Qad89GzUOAg5RsVO4gd6QGGmbBgAYPqqQA7bWBttdBJ04awU38
	zVrKT5OAFEmzzmKn9FU2QjSF9ELv83HN1ikh3vjYd5ZN97FCBvViwpePt1dTkV/W361nXqQBVKd
	LP1gEwkNtJcAcUEDIBq3HyCKTFCV0rLLTNWG6fQ6L0+nnNlMRm1TTGtWaqj6ZCuN99EM4hqhQKd
	tIFVwvmVwviY9IRIwNJovfDvhWZgeKJiRovYdBFhzVBYYYZa3FQ1tOw/+zzQlAAd2DKjUtfH3uN
	Km25O7kNd8C1zxuvd9i8bS25hqAWdhcQ09zy4UlhukJxknVW3Ztkbng+GVUdjFuPSqFTuyW8IST
	w==
X-Received: by 2002:a05:7022:4a3:b0:128:d562:26be with SMTP id a92af1059eb24-12ab284be7cmr3240616c88.9.1774673624118;
        Fri, 27 Mar 2026 21:53:44 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-78.user3p.v-tal.net.br. [177.4.161.78])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9895722sm1165707c88.15.2026.03.27.21.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 21:53:43 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 28 Mar 2026 01:53:35 -0300
Subject: [PATCH] ALSA: hda/proc: show GPI and GPO state in codec proc
 output
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260328-hda-proc-gpi-gpo-v1-1-fabb36564bee@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZukKq6vIhZVg7HQpkUkjXdXL
 M7iW5w/gCfH5KFNAjg62bPZIrI0Ab2obSbkMRqkkKXIZY3LqNA6o3G2HGewKYQqspoqpUuIN+t
 o4utLdv1vfwwr6f3twH0/Vf2HG3QAAAA=
X-Change-ID: 20260328-hda-proc-gpi-gpo-950a518e7ac6
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6173;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=zUUT8ULAWNosXjYUL6tV4aiDqB1v42lE04t7YEhqVDo=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJnH4y7u2+PkxbIyfMaO+qCNXG/sV7zcs7FEjLPuCl89e
 52GdRJDRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEwkQY3hf8j7fxHsUkp9C7Ud
 tM/uU95YJX1Hp5U5/2/KGdPcjiLNt4wMeyc0Xn6U9Dk19eQjozLT2YVH1qhcT0wtFGFuadN1ZW7
 hAgA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

print_gpio() prints the GPIO capability header and the bidirectional
GPIO state, but it never reports the separate GPI and GPO pins even
though AC_PAR_GPIO_CAP exposes their counts.

The HD-audio specification defines dedicated GPI and GPO verbs
alongside the GPIO ones, so codecs with input-only or output-only
general-purpose pins currently lose that state from
/proc/asound/card*/codec#* altogether.

Add the missing read verb definitions and extend print_gpio() to dump
the GPI and GPO pins, too, while leaving the existing IO[] output
unchanged.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 include/sound/hda_verbs.h |   7 +++-
 sound/hda/common/proc.c   | 100 +++++++++++++++++++++++++++++++---------------
 2 files changed, 74 insertions(+), 33 deletions(-)

diff --git a/include/sound/hda_verbs.h b/include/sound/hda_verbs.h
index 006d358acce2..127e7016e4fe 100644
--- a/include/sound/hda_verbs.h
+++ b/include/sound/hda_verbs.h
@@ -56,7 +56,12 @@ enum {
 #define AC_VERB_GET_DIGI_CONVERT_1		0x0f0d
 #define AC_VERB_GET_DIGI_CONVERT_2		0x0f0e /* unused */
 #define AC_VERB_GET_VOLUME_KNOB_CONTROL		0x0f0f
-/* f10-f1a: GPIO */
+/* f10-f1a: GPI/GPO/GPIO */
+#define AC_VERB_GET_GPI_DATA			0x0f10
+#define AC_VERB_GET_GPI_WAKE_MASK		0x0f11
+#define AC_VERB_GET_GPI_UNSOLICITED_RSP_MASK	0x0f12
+#define AC_VERB_GET_GPI_STICKY_MASK		0x0f13
+#define AC_VERB_GET_GPO_DATA			0x0f14
 #define AC_VERB_GET_GPIO_DATA			0x0f15
 #define AC_VERB_GET_GPIO_MASK			0x0f16
 #define AC_VERB_GET_GPIO_DIRECTION		0x0f17
diff --git a/sound/hda/common/proc.c b/sound/hda/common/proc.c
index 3bc33c5617b2..c83796b13d3d 100644
--- a/sound/hda/common/proc.c
+++ b/sound/hda/common/proc.c
@@ -640,41 +640,78 @@ static void print_gpio(struct snd_info_buffer *buffer,
 {
 	unsigned int gpio =
 		param_read(codec, codec->core.afg, AC_PAR_GPIO_CAP);
-	unsigned int enable, direction, wake, unsol, sticky, data;
-	int i, max;
+	int i, gpio_max, gpo_max, gpi_max;
+
+	gpio_max = gpio & AC_GPIO_IO_COUNT;
+	gpo_max = (gpio & AC_GPIO_O_COUNT) >> AC_GPIO_O_COUNT_SHIFT;
+	gpi_max = (gpio & AC_GPIO_I_COUNT) >> AC_GPIO_I_COUNT_SHIFT;
+
 	snd_iprintf(buffer, "GPIO: io=%d, o=%d, i=%d, "
 		    "unsolicited=%d, wake=%d\n",
-		    gpio & AC_GPIO_IO_COUNT,
-		    (gpio & AC_GPIO_O_COUNT) >> AC_GPIO_O_COUNT_SHIFT,
-		    (gpio & AC_GPIO_I_COUNT) >> AC_GPIO_I_COUNT_SHIFT,
+		    gpio_max, gpo_max, gpi_max,
 		    (gpio & AC_GPIO_UNSOLICITED) ? 1 : 0,
 		    (gpio & AC_GPIO_WAKE) ? 1 : 0);
-	max = gpio & AC_GPIO_IO_COUNT;
-	if (!max || max > 8)
-		return;
-	enable = snd_hda_codec_read(codec, nid, 0,
-				    AC_VERB_GET_GPIO_MASK, 0);
-	direction = snd_hda_codec_read(codec, nid, 0,
-				       AC_VERB_GET_GPIO_DIRECTION, 0);
-	wake = snd_hda_codec_read(codec, nid, 0,
-				  AC_VERB_GET_GPIO_WAKE_MASK, 0);
-	unsol  = snd_hda_codec_read(codec, nid, 0,
-				    AC_VERB_GET_GPIO_UNSOLICITED_RSP_MASK, 0);
-	sticky = snd_hda_codec_read(codec, nid, 0,
-				    AC_VERB_GET_GPIO_STICKY_MASK, 0);
-	data = snd_hda_codec_read(codec, nid, 0,
-				  AC_VERB_GET_GPIO_DATA, 0);
-	for (i = 0; i < max; ++i)
-		snd_iprintf(buffer,
-			    "  IO[%d]: enable=%d, dir=%d, wake=%d, "
-			    "sticky=%d, data=%d, unsol=%d\n", i,
-			    (enable & (1<<i)) ? 1 : 0,
-			    (direction & (1<<i)) ? 1 : 0,
-			    (wake & (1<<i)) ? 1 : 0,
-			    (sticky & (1<<i)) ? 1 : 0,
-			    (data & (1<<i)) ? 1 : 0,
-			    (unsol & (1<<i)) ? 1 : 0);
-	/* FIXME: add GPO and GPI pin information */
+
+	if (gpio_max && gpio_max <= 8) {
+		unsigned int enable, direction, wake, unsol, sticky, data;
+
+		enable = snd_hda_codec_read(codec, nid, 0,
+					    AC_VERB_GET_GPIO_MASK, 0);
+		direction = snd_hda_codec_read(codec, nid, 0,
+					       AC_VERB_GET_GPIO_DIRECTION, 0);
+		wake = snd_hda_codec_read(codec, nid, 0,
+					  AC_VERB_GET_GPIO_WAKE_MASK, 0);
+		unsol = snd_hda_codec_read(codec, nid, 0,
+					   AC_VERB_GET_GPIO_UNSOLICITED_RSP_MASK,
+					   0);
+		sticky = snd_hda_codec_read(codec, nid, 0,
+					    AC_VERB_GET_GPIO_STICKY_MASK, 0);
+		data = snd_hda_codec_read(codec, nid, 0,
+					  AC_VERB_GET_GPIO_DATA, 0);
+		for (i = 0; i < gpio_max; ++i) {
+			snd_iprintf(buffer,
+				    "  IO[%d]: enable=%d, dir=%d, wake=%d, ",
+				    i, (enable & (1 << i)) ? 1 : 0,
+				    (direction & (1 << i)) ? 1 : 0,
+				    (wake & (1 << i)) ? 1 : 0);
+			snd_iprintf(buffer,
+				    "sticky=%d, data=%d, unsol=%d\n",
+				    (sticky & (1 << i)) ? 1 : 0,
+				    (data & (1 << i)) ? 1 : 0,
+				    (unsol & (1 << i)) ? 1 : 0);
+		}
+	}
+
+	if (gpo_max && gpo_max <= 8) {
+		unsigned int gpo_data;
+
+		gpo_data = snd_hda_codec_read(codec, nid, 0,
+					      AC_VERB_GET_GPO_DATA, 0);
+		for (i = 0; i < gpo_max; ++i)
+			snd_iprintf(buffer, "  GPO[%d]: data=%d\n", i,
+				    (gpo_data & (1 << i)) ? 1 : 0);
+	}
+
+	if (gpi_max && gpi_max <= 8) {
+		unsigned int wake, unsol, sticky, data;
+
+		wake = snd_hda_codec_read(codec, nid, 0,
+					  AC_VERB_GET_GPI_WAKE_MASK, 0);
+		unsol = snd_hda_codec_read(codec, nid, 0,
+					   AC_VERB_GET_GPI_UNSOLICITED_RSP_MASK,
+					   0);
+		sticky = snd_hda_codec_read(codec, nid, 0,
+					    AC_VERB_GET_GPI_STICKY_MASK, 0);
+		data = snd_hda_codec_read(codec, nid, 0,
+					  AC_VERB_GET_GPI_DATA, 0);
+		for (i = 0; i < gpi_max; ++i)
+			snd_iprintf(buffer, "  GPI[%d]: wake=%d, sticky=%d, data=%d, unsol=%d\n",
+				    i, (wake & (1 << i)) ? 1 : 0,
+				    (sticky & (1 << i)) ? 1 : 0,
+				    (data & (1 << i)) ? 1 : 0,
+				    (unsol & (1 << i)) ? 1 : 0);
+	}
+
 	print_nid_array(buffer, codec, nid, &codec->mixers);
 	print_nid_array(buffer, codec, nid, &codec->nids);
 }
@@ -940,4 +977,3 @@ int snd_hda_codec_proc_new(struct hda_codec *codec)
 	snprintf(name, sizeof(name), "codec#%d", codec->core.addr);
 	return snd_card_ro_proc_new(codec->card, name, codec, print_codec_info);
 }
-

---
base-commit: 0ce5115cb8f38e23044b04644fce7661336c1efc
change-id: 20260328-hda-proc-gpi-gpo-950a518e7ac6

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

