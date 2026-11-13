Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606350;
	b=LBcz110oZmXEn5V2KyodmMt3RGPMWuuFHi0ELk9DhdyJ3HxLN1ciuUnrtYInPF9YmWVh
	 yG0jXI4tVBgDltDRE0TjRbyxJr3rJ6shBSSbo3oYAJ+BecY760nrgjpI/U37GozR3Ml6O
	 nWk/otVVr8Pthsqb8MShPDgSsaHGpjal8XXrFKxqCiIY8GrOfe5TDThuKmo3PEzU2a1yC
	 y+4Lqef1FQ5BpDM4wTZFrBpjA5wpln58nzH+r3x7FURwl6StWeEmMpbSZ/r9oBsJcbT1a
	 MXXGsfZDPxanKIw9rl7UDNmTRb6T9L+4xg4pLQ+ZGwu3mVPWtcEopgPx/LBZAAtfNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
	b=w+y3MVukFTvwufNXogFHcf0f2y3xx66jaq55zMY81DN7OIHMVQ0cxUsQJKxBqTFpa3v/
	 n/Pt+7BeDOXuuJkXL38mX8N93YXFjJltgL0RKgW20848VyIzby5QBXOvzeza2d5xN61zL
	 ZBOGWBmedvhy33f4XlQOQpPBvYuH0X5x/hmE99kbddcvKYQA1zeDP0xbR0gzifPorX0lq
	 dZ5sNMXYCRRA7yboo4I5pXgtHrjpxCDfq6PYnDuP8yx9eAvuBX4nvIMz6yczy5N5QZo+r
	 ZYHN1h+K9XNyJtD3CgVvoGYMfkUxfU2B2u7WsfsjEwrANGlCUzB6DMfSYfP1b2LpDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3uGx+gv;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2D606A336
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 21:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBD2D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3uGx+gv
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8209605e9.2
        for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 13:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794606348; x=1795211148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
        b=U3uGx+gvuZDprzJ4de+g1kPBhFPsmhOG8fbWOLie4ZXFQmNrteTZcEMXX6pVg9UPSU
         cApvRPxr/1uid9VGXaDI7fxh2MVOBcFRqUWH2DHtD/cscVA6C0/NzWKxVDqDhoxyWuGx
         cltzpA08sMXM/KOaBCfELHrrJjlb8BLhdMc3huTbz8UuIWR1aETLtG9wFjgS1xjlGo1r
         2eOPseEBdATET3c5Do4XzqBYi5H4gmQt7RdvuiujvD6mjqz43N8dP1uaK3MilzfHJewQ
         jPGJ+jJhe+0ogNdVhfniiW44qkUTFtHl5e+9i+IjD8ywpaYz3ECFIbZKhHmmPIkOASZM
         TFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794606348; x=1795211148;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qnZe4r96eV9XQddf8cIn7zFYQlAR4JFIMaPlUKVPy/U=;
        b=lr5daUnseqK1SV/fdYGJnVsb4ApVK/i3UJviFvKbTgdvktvrhV+CS9sVKozMeh/EhN
         sMd4x0ZQ9QYQ0OXAEC4BmFEFVGrfprfSWzDMLxifCii5onjLP1UtKmBKD9CwH7dkvlxq
         T6YGIEVdnBIG4n2RJFeQAO6DHAzxtkzPyeuesaQsy27AihguXINLAFEMq83jcWO3jkc9
         d7pjbRBrWmEbwSktGieBM6rPY4vtS1JnsypKg4QMiv8VxeHVuC/Wi4YwywUOBgVOEbwb
         taxjbzoDAh6Y33XHut4sA9l+8+xGlEqxthKcD6Tz/5VsmMPNlYfOTGEPfcx65zf38qGq
         r3Eg==
X-Gm-Message-State: APuU4Z+cOJ/WQH/ZtJ3LgkMcTpd2Qeu4pgiNW8VBmPz2DYRyx3al6yHh
	YMBchWCMW5cqDCc0T82KZ7uO4O8iWCFJ8pmpa8fzTEt2nLFH/5C4amZ9
X-Gm-Gg: AYBFou3R6MGmX7rC12KOZaL6sv4oZjbgLc0EMFuxM9RGZPDXPiHhmZS7xudrM28wDA8
	XTmJ1nsgOIPpYDGjb1vaCh2/xO4Zgn7tOfQD885zg/HKqi7fBE3p0C8VHjOxrmcWSebCqDAEd07
	HKiDYY8OvQiS56F0Oz1XJKNdWXOKHcDjsqIusVKFR/FFSb931jLyeAuIvOlFjgG2YeqW7f9Mssy
	KlEBKyaSNNmjQ33MN38lbDJSmHjqdD9vs9kFC0WT+ox7a7orzZCXPI2dWF6cwDTna1f0pKNWSPW
	GQMqhLA9bjutaLZM8MsjtT6iIlRJxkignDQNfigBLgd8JTWHEM0XmQrIc0askHAjbqHN0PDmd5l
	kWMfj5LUmxvdh7W9ow+raFhCLP2yhlHfoTflVgrY2kn6jEqZP+go0pNbESddOM9YepnSRtMtuSr
	ipzC8AQ0Vpdld64txsRgHmayN0+gZvhGjudFKNnnR5tIifXYMH7MvgyjsrHJcidT8UUdUlnwSIH
	IC16uEc7pObR4mTLUQKJu63Y+KQpxG4AY89BkMrcJoJZhOGuW3WfT4tp6mYrPg7dhXQSgQDie5J
	KsQFYXH3JmWCiWGdDQGrVRFph0voCYavAbO9zsvRxITjZmLgCg==
X-Received: by 2002:a05:600c:a44:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4bb55a45045mr82664865e9.11.1794606348036;
        Fri, 13 Nov 2026 13:45:48 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e294420sm175346295e9.9.2026.11.13.13.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:45:47 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] ASoC: qcom: common: report line-out plugs on the Headphone Jack pin
Date: Fri, 13 Nov 2026 22:45:35 +0100
Message-ID: <20261113214544.232836-1-ingo.kubbilun@gmail.com>
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

The WCD MBHC classifies high-impedance loads (above linein_th, 5 kOhm
on wcd938x) such as active speakers as SND_JACK_LINEOUT. The
"Headphone Jack" pin only matched SND_JACK_HEADPHONE, so the jack
control stayed off and userspace (UCM JackControl) never switched to
the headphone output for those loads.

Seen on ASUS Vivobook S16 S3607QA (X1P42100, WCD9385): active
speakers measured at ~20 kOhm per channel were reported as LINEOUT only.

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 sound/soc/qcom/common.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 5dc954dc1cb2..af5cacddf67d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -335,7 +335,11 @@ static struct snd_soc_jack_pin qcom_headset_jack_pins[] = {
 	},
 	{
 		.pin = "Headphone Jack",
-		.mask = SND_JACK_HEADPHONE,
+		/*
+		 * WCD MBHC reports loads above linein_th (5 kOhm) as LINEOUT,
+		 * e.g. active speakers; treat them like headphones for routing.
+		 */
+		.mask = SND_JACK_HEADPHONE | SND_JACK_LINEOUT,
 	},
 };
 
-- 
2.47.3

