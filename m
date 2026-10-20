Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513424;
	b=wCndhAfsKYw8w6NnpGZ07W7CqUi04js6NUiCqM0QHcBdlOl6PXsGF+a8wdpF/fO/kwq7
	 d6dUJOc7VHl5f3mp96Mrhi3dMlsCxcR/Co/pX5XD7erelCvKK+Xfv1RTHQTPjbYj7IlCN
	 XZr3QQSsC8gupeE7kY3YfW4O6UqeQA+UIAO7AoN9HJO39G+4+m0D/w2IFF1Awk6jXIIUi
	 lKWJTYSOq0DI2vpPAqezESNMAylI/Q4kuhnN2erPSGjB3BsB2vn80D8gDuismi9tCRh/G
	 46N8W1VIXtldfXTxh+SrMQYT0grcAfPBgL8YoMQXHc+8qFLG+xWe4NJDixMz5omNfoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=azHAjUVbM1ucbuKC4iwbKP4bd6cahq9pYB80+6Q8KUA=;
	b=q7br/d5GbCxOXj6uN+mxfHoHhuTCuc1CF9otE2RaLu7TpZDTBzP9daAE59LYPG0xaTgy
	 Fz92crY8gav8Ht6QbnfNqO+MqzLPOh5kxaBVkFRNeWZtqq8EdjZokhxdJibmlbk25NvoB
	 Xbiuk9KPasIZt/+M3zU6dRhDRBZtI6QY35oj9Awnygw5zlYjIq1gcOat2Fqo1DW0nWZXt
	 0Q+1KrJXi6FkqrHRyVYzpmEa1xXsYY1ZuSLlYaoOeEMed+ook744dC1wsfPE6ltqW0jzG
	 zfkNu1EODZEveDkC8xFDXhEirpMpFte2Sf88q8PICs2DCCMuRHvq9GJhvAkXMcLVgzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pLbQj5rn;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EF5606A31A
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 16:23:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7EF5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pLbQj5rn
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso1228218a12.0
        for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 09:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792513423; x=1793118223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=azHAjUVbM1ucbuKC4iwbKP4bd6cahq9pYB80+6Q8KUA=;
        b=pLbQj5rnEbAkJY1lsLhV26iOOD3oSkMlvR3I7lQhJLnW+GuChSFLa4w/hf2r66GdSg
         pnaxbMKdd2Bw6gLEGCasJxAdidWBw+MRTw+/+ySx/hyqiV++aYa8+Xrllp4c/4YW6iMb
         KQwhA7rk2pxiS/Fdwi6AHLsfnFpNOTlnLY1wHCtvaJBOXEynGH6Y8BT/rYFHmFc8om1G
         lJJxI1rXhEOeI/IjNnyDDAuKlM0IwBL0PjEBL2XOUYzoNNRf7Lrdk+X1CHoRytl8fe/E
         th8p3O+xIMA+tgnlb//hoy6xuEPrlGK8GV3Q1R5deTV2ctgjo4AR7cCOLLwJAlgD9553
         UkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513423; x=1793118223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=azHAjUVbM1ucbuKC4iwbKP4bd6cahq9pYB80+6Q8KUA=;
        b=NXYZ3qSYx8uEukEjuaVFtMKV3pl8dND4j7ATRn5yRmbdDDsGC0PYvDDAxuRaBltep/
         Ra+97rwWoI76mM19JSdFNCKXTog2tesNwHcWPnRHAkXFJOod3hgWC0hvaFbiWc68x6Vi
         blP5oLlPrhal4DWgWApTfJllWUfOPb5rt1h62wRNXHbdMVLbJzzsrLkw1All1zMR6BDi
         eojyx6CQcPXUunYFbUfWYI1UpT+7LKn7qH3DnQ9C/00VgYstQ+WT5qM7f18KGfV/fmkw
         fyWXvN6ZISs0W8B5dclo7/X3Wma9NPDC2YTYo7AU65U9wLVBcLxIl+hj5t/Qdf3600qg
         SNhA==
X-Gm-Message-State: AFq9FYLWMgDdYbIPHAvbSfOl2AyazvI8OmuRz2Nc7dj1nfoEWTrUbOgT
	cM8fvfzx0cEwTKxx+5FpOkgT9g8kskpuZwTuTHhoukEmdA3kZJDTDwOdpQy+4rFj
X-Gm-Gg: AYBFou3h4LYUhG74FKLJYAm/Q1WctwtmBNxGBV/tjk/bHCs7MnTnw1anBcTSFzJPRCa
	fiR5hm7yBvZsxZ6TZHMYhFlgjnTdGtKEELRXM3WdaQIkkoRV3Y4aFxCg7FLcCcK1B77Sbgi08IM
	+c+i1EgZxmNnv8HaSAzCMV6jAbfYH0bYhpkFJ9j7xKeMvSc2ESv06mVeAEKznA7R/JqGX+rkjui
	4fa90D2IPZPoozHcMqqTv4Nw5N6q6SMqBF67HxDlQ//mViNoZGNND5Tc3vfTu8yjj4MI0J+lBpA
	rwj8Jc58YHVxlw62zMuUNSCLicpgkmMsIamZgWWbWqRYzXb+eXrhA/bJPZtokwidPacN0W5MruU
	rEVW0HVLfVxC+HMRfy7MvN4CMWXveGPcCiOWyc7lvWlDrsqT/uanhTzCWEYDra93123/ZAtqdb+
	paDAHnAqLSctCBxt+lPNGzevu2ZB9lYCY7NM5W1p2LrhcvtkBwhxU6wD6X18eNe27ICwwkh98=
X-Received: by 2002:a05:6a21:8201:b0:3e2:7c10:d46b with SMTP id adf61e73a8af0-3e27c10dddcmr1103139637.13.1792513422882;
        Tue, 20 Oct 2026 09:23:42 -0700 (PDT)
Received: from fedora ([2001:e68:550a:334e:fe01:fb02:2389:ed82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a06a6407e0sm2286701b3a.5.2026.10.20.09.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:23:42 -0700 (PDT)
From: Nazmi Maizan <nazmi.maizan1@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz
Subject: [PATCH] ALSA: hda/realtek: Fix speakers on COLORFUL L1 Plus
Date: Wed, 21 Oct 2026 00:23:23 +0800
Message-ID: <20261020162323.23202-1-nazmi.maizan1@gmail.com>
X-Mailer: git-send-email 2.56.0
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

The COLORFUL L1 Plus (Rimbook L1 Plus) with an ALC233 codec has silent
built-in speakers. Its firmware marks pin 0x1b as unused (0x411111f0),
although it is connected to the speakers.

Retasking pin 0x1b to an internal speaker (0x90170110) restores audible
output. I tested this pin-only correction with the early HDA firmware
patch loader on Fedora and confirmed that it still worked after reboot.

Add the subsystem ID 2782:a248 to the quirk table and reuse
ALC233_FIXUP_MEDION_MTL_SPK, which applies the same pin correction.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222155
Signed-off-by: Nazmi Maizan <nazmi.maizan1@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index bf53fdd..4d4b45f 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -8724,6 +8724,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x2782, 0x4900, "MEDION E15443", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x2782, 0xa128, "Positivo N15RPE-S", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
 	SND_PCI_QUIRK(0x2782, 0xa212, "Lunnen Ground 14", ALC269VC_FIXUP_LUNNEN_GROUND_14),
+	SND_PCI_QUIRK(0x2782, 0xa248, "COLORFUL L1 Plus", ALC233_FIXUP_MEDION_MTL_SPK),
 	SND_PCI_QUIRK(0x7017, 0x2014, "Star Labs StarFighter", ALC233_FIXUP_STARLABS_STARFIGHTER),
 	SND_PCI_QUIRK(0x8086, 0x2073, "Intel NUC 8 Hades Canyon",
 		      ALC700_FIXUP_INTEL_HADES_CANYON),

base-commit: 8a5d87c2ba30e8de31cfbe888fd4d95f43c63db9
-- 
2.56.0

