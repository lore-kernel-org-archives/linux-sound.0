Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795405878;
	b=rfM6j7Fv5Yd3wJK58/aXsET+VoM2Vwfv/Eeu6BmOJTt00adokYVaFYQ7q/VcP0T7IJ+e
	 UjtL+sDWRge6Ofeq4Ss9ktr6Ft8rnDVwrhrwuO65t96IZg3vP5ZiYTby9XbeXdXIEuSno
	 QDPlLR3udtgwBO6hDsSHuhfE6NHmo6B7ghrYZI4ChYrPt5n22TjU0Aw+ubL256/gC5cvj
	 +wF1Wr75jJuOmXya6YKhVTAB9x401LuJO/Mv8feyAqah9EY9sBiPElswdElCDEK7xnuWt
	 wk4wJ1Y4gCuhZcfM/+zTnGeEgWwh2G0HcgJXW1O9Y5kVslDL0CTWkILElOyeQDyJ0iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795405878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0zns/FuWCRSzTf6H3hGrIkVwqafbH8YtgIAHr0k4B5I=;
	b=HOUkpXX+W1psBlQ6LDeJhzYXjCAggbyEDuxA0I0yl6cii58VEkeqjxdm0zrI5hlB9ajM
	 765qAf2tokzBtodVttTBM7Tv0HxLzuz3BmuuJfKKU11EzZ7c8pwAdNsFKPYPOULwjSuBN
	 cKg5g3eqM8FPBg40/5pv+k53L8Wa0DobJnfkl8qh4f85b4Tq9jFAKtmExZ/waQAMi/QCZ
	 UyNL0e6PZpYZeCw+cVu63oQqF2fsVUlaoZoJQsVsdWrHdAZ5UCsgTocarrTcSARn/sB2C
	 dOPYf3C0tbmaKP1gcBntVzmC74BWYBRgMRX7Ov5F9OgXSgi3ZFlZAdh9E8K5gTg51/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGgQPVVI;
	arc=none smtp.remote-ip=209.85.222.46
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D84606A31E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 03:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70D84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VGgQPVVI
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-99e0b348a05so687750241.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795405877; x=1796010677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0zns/FuWCRSzTf6H3hGrIkVwqafbH8YtgIAHr0k4B5I=;
        b=VGgQPVVI27LpeeLquO/xK7PrifE2nfRnVLaSiKUDRTSHUvbevR2As0M4LzQw2kAZkc
         dU7RsyTN8EfHSf3bhE1ttDC88cmAGidxpYIn9N521bNbw2Sje9kp6owvUoJtR4hg1cUc
         gYkeDVGDrgtVUjjDgAifC4V0RAUf8I+9ubAXiDOYYzgPCCQh0x3ZV1/ssvP7D4yorAaW
         Xf0MOU+lhjw+I3tg9bGaOCEleIgWRChQiWY1ZVWm7Gf2Bw++bULxmnqJkGLCnjk7vOnP
         WNq97Zj6wxtkiAF0xOpux2xfzGhrTuLPY9VKvXYH+kC/IVTKi5Ox0y9z/5ZOtqGBXg5s
         Nlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795405877; x=1796010677;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0zns/FuWCRSzTf6H3hGrIkVwqafbH8YtgIAHr0k4B5I=;
        b=r+Pc9g5c6VdD1tYU+WAlL13RpiZagD7N5UYObiJh/g7Tm9ToVbyz+vNkkpRhdUp/hc
         oOz1ZXOfZ3tZv+KyMeNcAOo5J5E7dyyqDYi7rZuUyFz0b1eMY/lCf5Vma3U2asr22jFv
         hvO3FX5JwxgQcf5Vtahw9cTQt4Z10ZZLzzdeEa/2ZnnBujAnOnlFndk6XN2WopQRFBGw
         I6tG4hzb2TUibPPsoD6g326kBlV/xSNvAwEoPZ7Ph7feqQ61V2ZiNlw2hCWdKpEaSFPo
         RsUvNBowaGBmeLDgJtcFjO/ZCJRDaacAhQ1qzO+DFd1w88UyvcHukgwK+N1C3yR5eno/
         lkJw==
X-Forwarded-Encrypted: i=1; AL+hErFtnkMZKAz2SkCX8vDziUEDDGorKCT75iGENIGoYZFY9tUxc7f1MGdNbUcW7M4H/3DHP7SvVyMuOW6t4A==@vger.kernel.org
X-Gm-Message-State: APuU4Z8QDQ4AT7bpCSMfZP8yVl8tBN7hoafL18c9JZZTftlZNxgf5r4D
	jIdLwcFr1I7UzcymZTVdnCFlIYuLkCPaCpmw4PzR5m/eKrGXCj4Y8+o3
X-Gm-Gg: AZFdTZf9CQDZJ3EX0Q9wQSdZeGw2F8MP4t7kCfoYAO7/4doZolyQvtgHd/S9wFyyo70
	FIOsRBLkaE9SXS9G22YmSHAqZZfKLzfzDs/62N1lr8wQFKn5b0tpnr3rQhkMRayz7NBoqVSo+x/
	JypM37b4DOBx9ejrQUcA0XT0c2RjOAN404+gAm3p65QYtk8efs3MaNaVL+jL3qoP0gR7AmrA6IY
	L6MGvzFSjW4n6h4R9t63y4WzSFs1ziTwxiTR67m31B4pA7W2F1cWqI6apd3AkW9AacppoBPi/U7
	cKMtq8ibD4/iW+86uiY7K55EuZHvsg7lcl5nFQquB/vxC2oAqBLffVHLCW566zdpDQUS+wFDe64
	Kjp/Cc8e88G2sjWew25MjjkBRh1oQbrqg23hvzuORGaUSpqPn9BBbc0DkZR3HsTT+A1URO7pqnn
	Ph3YOD/PfVURUObKPHMgkpHFtzPZswZiZok0sZkL0xk5KCACkpxRfwjIDXvZYb0qJEcaPIVleIn
	vIwDVcUFeehQiP9l01H0cWNUcUIKo0VfL800YJxspmPFSqVoN91tkZLBw9RBOjKehp59OnpKaH2
	F5m0v9ojVz/q48uhxC3YF9/epUU+HBqXcVmljR8W1A==
X-Received: by 2002:a05:6102:26c2:b0:7cc:2946:7f69 with SMTP id ada2fe7eead31-7d73935fca3mr4111495137.8.1795405877116;
        Sun, 22 Nov 2026 19:51:17 -0800 (PST)
Received: from william-VivoBook ([2800:e2:ad00:1be:2d8f:4024:2b8c:a109])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99e6e0a2865sm10463616241.12.2026.11.22.19.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 19:51:16 -0800 (PST)
From: =?UTF-8?q?William=20Alberto=20Jimenez=20Mu=C3=B1oz?= <alberto1192456@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?William=20Alberto=20Jimenez=20Mu=C3=B1oz?= <alberto1192456@gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509UA
Date: Sun, 22 Nov 2026 22:50:53 -0500
Message-ID: <20261123035053.12487-1-alberto1192456@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The internal microphone on ASUS VivoBook X509UA (subsystem ID
0x1043:0x1961) records only silence without a quirk entry. Add
ALC256_FIXUP_ASUS_MIC_NO_PRESENCE to fix the issue.

Verified on the hardware by booting with snd_hda_intel.model=1043:1271,
which selects the same fixup: the internal microphone then records
normally.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222320
Signed-off-by: William Alberto Jimenez Muñoz <alberto1192456@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index a6b5e8987..f527b626c 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8196,6 +8196,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1043, 0x18d3, "ASUS UM3504DA", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
 	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
+	SND_PCI_QUIRK(0x1043, 0x1961, "ASUS VivoBook X509UA", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
 	SND_PCI_QUIRK(0x1043, 0x197e, "ASUS VivoBook X509DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
-- 
2.53.0

