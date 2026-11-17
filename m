Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794951812;
	b=5adrCIqMjMgy3uVuP/HCF4+DbfHEqJQYby8dy/5SwwE80OECduENjOYWprQdC59dkMTa
	 YfVso+UNsr7/hQ8h3q3K6DO96sVVsZLE+v/WN0RdasRroGsiet0gZWhDpU80yfckp1obG
	 2dT+1ULCz7ycFJNLPPYn5MWB+fI4PzAhQ7UYwzd77Avt5fi+k8ULD60Jg9018Swye2N7k
	 KA/luf94nH1ZU6R9utqHutI3Gs5kNmiHVvjzTNBZnuvM0bUwVibGDA6Seta3D0Y/JItcc
	 gMXGGLIVYUIAdVuS2r/UtN5WTplPfzSeF8bW6sBPpcsFk9tQZ06SRaYxOXtIz7m0T+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794951812;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kDVcn8uLG74ma32d8wtmy7ktrF0XJBSPshTOfgs6Qj8=;
	b=uTkHr2ibMcH1nMeeQ2niYAmVWcrn8msBsiIK6MmUP87Zv1xJnV5QcN6d/H8gFHdV4+O9
	 7qBkbSPsQdp4J9c3Cs5Mufl0ClpwX61PS8htQka498WM4VtA3Rd/7EIgJnJUWXiWfXpd5
	 VnGXj0Hq9nCUtlgMm/unCRdtoi0bj0cV8oYUE2vCC826XgnYuUZ0Da4lOst4t+hCUwFV+
	 dNW/OOqEF+8K3YkcL0Bv8gR5IL5dE86pct/QLCOH9JM2MmF7H4WDKu+W1PetboDo9wvrj
	 BhHPdr/LIo1AOtIQ9af26PUO6/4lHX/WilWza+aMvY3jPzSBLZWOUDU0snzU9bs2kPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=sung-woo.kim;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DC9606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 21:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49DC9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sung-woo.kim
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so507120eec.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 13:43:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951811; x=1795556611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDVcn8uLG74ma32d8wtmy7ktrF0XJBSPshTOfgs6Qj8=;
        b=B+hGK4WqzOD1IR4nlN0JmVD3rd2zxeUPRJKRp8VxkVYXssYAPMLN4itPHoS2dVF6Fe
         7peaPCBaHs1cFdyxl+wYnOCjV4ZA3t/aU7v2K4Xo7TERpR+KnZJeudtVhYR4ysjBIZl2
         btrlDlyupUbr0HfxXQiSuT7n8Wuz1T1iomb4O/3/HPYIHDe5gryIf29RqOmR7XnC414+
         gZRh1FsMu1H33QusuXPuytlVKDKYNKTaaVVLUOczvW8VbZTu+Cb7h7/+oz81NGPY+kzU
         O0rHDmIRzPI67AiM/E/270W7pQv/auKKxOn2+xqED3Q5ZqUGul1dXQdgqU14aXYrFjMs
         HnRQ==
X-Forwarded-Encrypted: i=1; AL+hErEbM7R2F2qBKrNxwFMATp3qqDHdfZdYp4FjjUUmEP8r2X/SIFc2jwdI5yW9505o3kkbLrkollWt4R5TfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z964qCDtP63Ev5KUw3RqIu0Ji8lDa+cqlf9vaHp7N/w8pZpnyQX
	KGSQVacEWweJ2e6/Go8vPfc8A8lMDTrq3oR8o5vlSirc096qTMqp+t6Zwctlxg==
X-Gm-Gg: AZFdTZf8cTNWsyT6IYeAI2eCwq0LOYfy9FxptW9LDksPGeC7hb3iC3vPQTlcFErxnQR
	VWVwAai+yGxQ2IC/sMjuv9kjvMF+uOGy/imHh/8tN89Cu1FUhlO/OeAJpX+/LqrBKRSbe85BNBi
	qg2vC1h5dh+MOiTfN1V4cQsJsn2BS6y15/QSzboWxTkXNUH8uZ2+x92AQ54Cw+6NPeYK6cKmPZ4
	8MNGvFRsMD1p65C0aZ0US2J0vrfl7lZFkbho1HbT10E+Bjz8NPAbeIMJL6xZrq1vad7PyprpU8S
	Z9W7P3TgUS1wQIFYSOvn0EFYCIQ1LopshYGdAIfg8+Gbf5fi5DGaGup+EGaXbWmIJceEPJnWlNT
	oO41ofSpOT5HzQXdr9IMb6Pgwl693OalmsHUbBmD4kjrxT7DS28QTE5yNHzbVPyCztKBbji1e3F
	hMnX4Jeuj/wSVtexHPTz2Y+JBOOEFmCqulRUkXeo5wTZWsyk7Cbb6xwuQHP8qxiR8rX+/1NLS/C
	94BWty1y7tL9oIvkfwEScEYGJDhIdebakovPaQG6Y6cgwH/9SGhCByfI2DKsTirIJp0rA9Fm6YR
	K2p1eJzVOnsHDflSCbF8XXLH/uiA1JxMhRZc2eAaeqlfuD+61FRnEao14AY6ZMzfnrVoTkhVcvS
	SkuTR1gsDBOXw2cA=
X-Received: by 2002:a05:7300:6a90:b0:369:ef63:ea95 with SMTP id 5a478bee46e88-3828101fb2emr560648eec.6.1794951811344;
        Tue, 17 Nov 2026 13:43:31 -0800 (PST)
Received: from tofu.taila6b446.ts.net ([128.210.0.165])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm1303828eec.3.2026.11.17.13.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:43:30 -0800 (PST)
From: Sungwoo Kim <iam@sung-woo.kim>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Dave Tian <daveti@purdue.edu>,
	Sungwoo Kim <iam@sung-woo.kim>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: hda: remove unused chain_id entries from fixups
Date: Tue, 17 Nov 2026 16:41:57 -0500
Message-ID: <20261117214157.2815179-2-iam@sung-woo.kim>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several HDA fixups specify a chain_id without setting the chained
flag, so the chained fixups are never executed.

Remove these unused chain_id entries.

Suggested-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sungwoo Kim <iam@sung-woo.kim>
---
v1: https://lore.kernel.org/linux-sound/20261115132215.4084031-2-iam@sung-woo.kim/
v1->v2:
- Remove chain_id instead of setting chained true

The unused chain_id entries were introduced by:
- f1ec5be17b9a ("ALSA: hda/realtek: Add alc269/alc662 pin-tables for Loongson-3 laptops")
- f83bb2592482 ("ALSA: hda/conexant: Add quirk for LENOVO 20149 Notebook model")

 sound/hda/codecs/conexant.c       | 1 -
 sound/hda/codecs/realtek/alc269.c | 5 -----
 sound/hda/codecs/realtek/alc662.c | 1 -
 3 files changed, 7 deletions(-)

diff --git a/sound/hda/codecs/conexant.c b/sound/hda/codecs/conexant.c
index 5f2b0b55ab6e..5b5250043a50 100644
--- a/sound/hda/codecs/conexant.c
+++ b/sound/hda/codecs/conexant.c
@@ -974,7 +974,6 @@ static const struct hda_fixup cxt_fixups[] = {
 			{ 0x1a, 0x05d71030 },
 			{ }
 		},
-		.chain_id = CXT_FIXUP_STEREO_DMIC,
 	},
 	[CXT_FIXUP_INC_MIC_BOOST] = {
 		.type = HDA_FIXUP_FUNC,
diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index 96fa8c2782bb..96b691926570 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -6431,7 +6431,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_TMI] = {
 		.type = HDA_FIXUP_PINS,
@@ -6449,7 +6448,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x20, 0x8000ffff },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_CZC_L101] = {
 		.type = HDA_FIXUP_PINS,
@@ -6467,7 +6465,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1e, 0x411111f0 },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A1802] = {
 		.type = HDA_FIXUP_PINS,
@@ -6485,7 +6482,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x21, 0x03214020 },
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC269_FIXUP_LEMOTE_A190X] = {
 		.type = HDA_FIXUP_PINS,
@@ -6497,7 +6493,6 @@ static const struct hda_fixup alc269_fixups[] = {
 			{ 0x1b, 0x0201401f }, /* front lineout */
 			{ }
 		},
-		.chain_id = ALC269_FIXUP_DMIC,
 	},
 	[ALC256_FIXUP_INTEL_NUC8_RUGGED] = {
 		.type = HDA_FIXUP_PINS,
diff --git a/sound/hda/codecs/realtek/alc662.c b/sound/hda/codecs/realtek/alc662.c
index a0efd4596c88..6a65ec772e9b 100644
--- a/sound/hda/codecs/realtek/alc662.c
+++ b/sound/hda/codecs/realtek/alc662.c
@@ -629,7 +629,6 @@ static const struct hda_fixup alc662_fixups[] = {
 	[ALC668_FIXUP_ASUS_Nx51_HEADSET_MODE] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = alc_fixup_headset_mode_alc668,
-		.chain_id = ALC662_FIXUP_BASS_CHMAP
 	},
 	[ALC668_FIXUP_ASUS_Nx51] = {
 		.type = HDA_FIXUP_PINS,
-- 
2.47.3

