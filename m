Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794391977;
	b=KQ8KWhL/WgH9941uVhPjSbWH5lukj/SrDNBl8DjOIkDzccJog4b3oIzlQBqLWCrkjTqA
	 nIWHUv4DofnHVeErs5MHHsSKZ1SN+/JaCc8UZCY26Z0VBwjkzWGO3ry5Vetl8lvrHLjOR
	 MDEFy10LH0HqxcWMOWhG/ZKFsuIv/d7WCH8KNyP9GPaxkrwL8e0bz1t5vtG03nFAlCpmi
	 RVaMDkfJ0p89Af8k6rsqPwaccdY6pdsya9NsxTAsg4LQwfaf6Rt5wKUNiT75M4U77wrnq
	 /mQZdRpj+XY/CVIX5klAcBBvATtq3Hob/TEgmshPeIPsz1CHNOHJeDaMDntiSuzYj8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794391977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
	b=Ya9P44EgOjkftISm+ZB7dAKBfTYxRcrXyxaOlFLeuOhHnTpUr7ZLAz8TPb1vwfMOppLb
	 VKtA32Z/pU0wY9WNgly0RxpLheFnE6EggxlbK0WDU6cL/tLdR90HR5hZ4aSWw/r4fFOwO
	 5Nd64tXtC22PKBcug3qfOuOf6ro1Az+3v2cxGCKcWtmYo+iEYEVGPEKQaH7WonFrMJwPA
	 Jp+dSCpelml2aOcTPjNPksSlPKh7JidJnEZWiCyejXtoJLH1xNCOz/A+zphf8JrcSjE85
	 5Fwd4vcEbRjryTFB7m7ei4oxJfnrMKfgohnPlZG+/7QZLpYRcIMLiqGQZRxT8SnxLZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M1BPuypu;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC9E606A339
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 10:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4FC9E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=M1BPuypu
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so30913535e9.3
        for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794391976; x=1794996776; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
        b=M1BPuypuqbOYuIE3OFv7eu4t5Z0ryvnYo/c0POh+pM8jus71+rhZO2KIJgZLydhafJ
         q0KVqwg5aHm7DeeNm2O7U1YD5cGeavuDSQHqLjyKKeF/Es2Zqjjzgvtv2H9il8ZuT3Pv
         f+ELOx53khbGuWY4jcYMgnAlaxrZMywmcWOoCBSIl+Yx17tXUJiSazCq6/vZSghbn8D1
         yUNc9/j6Rjb95DNy2KrNqTdR7qhCYxQyX0Q2HS6NP5nVZuJoiRiQ4XT1pSmMLwyawYGs
         a6kzPXFayQ3Ry9Nbuqf/pF1Gh3XITVXbKDrfq7siRMSO+HsZ9TfpFzhfD8NtoYFnUfjD
         9LRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794391976; x=1794996776;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o4Vnk0yWIEYevoeI5rytnlxL+lVUP6Dc9a6y6ecj/KI=;
        b=wevSJGo+DTVZcJCRAkrIBk+j92JZ1qVqFZvJ8sTBkCjv+ulZyknSUll+EvN0+fu4cA
         l/iF6Am9Ru0pG7E6ZNY9si46qFu7HkQA3yXzX3qhVgYfFE9a1V73NJ+AQPHmmVHimlNk
         O01n3JpZ0j99iIXmYFQoGO9fzMIGHiMHVCxkunY1755TQUjO9IPa60xCHAoXJJRh52wd
         g1j31Ku+KMe3ph/rfHljmPsNFolVwqRhCosYeB6k4Y0ltrwRLmkMjiJYrTTSrGVqYMss
         mXVWkFU55UeSuipTdYHsNiELjyA0jVgPoMU7FIg6oH2lKS0toeOxePIuWshv0etBoB/0
         45HQ==
X-Gm-Message-State: APuU4Z9+3q0hfaAILS5qfUR9kM+EGn4oNYps0n184KMix16VKTKusZwj
	cC4AXbW4q/8ROYPbHjA0r0IvmtgOv2g/oxJ574VjlcIJlf7U3zYl2KT3YC4SdW6fhr2vwe+tZsp
	+N4p0MEA=
X-Gm-Gg: AYBFou11AXriajSvVum0/z5hZkdlXig9aGFo0ocE02xTUUpWt9/gb7/dlUXS20Dnd9W
	LHbCIiCVDw+BbKufG2+YkJxzGdgfm6wymEPghy5b3dfOuncwmfo0dF7D+YBmpQtiZg6pe/cwz87
	hW9GVaXuK+aR3HHkXZEsuW4VL18xzk4Bjom2tKHp9AvSSgntTe7/OF/zkBQw8RnrZ4GinFT736W
	A1qsjWwmTqS5uz9hWTw5HDbvissKoaJHRKU/mtlEYBGjp9F7RvIF8lci+l1LPrS8B+slnRzu2U3
	O4OWJwhZCGH1sK5jvvOYKGkMBE7QE7NkWIE3jh4WMCc7UQSwBGFcSfL1a2/dbFBh6iE9STueA6n
	H/49jnnoJMgbHt9Pte4EEFr/ioG2Onk0RGjX1Vo6/MbEwbuDm/WET6uL95lx2cfUiq1u90JDGqS
	LBwbPXDD4kFkHUJ9xW3Yv6HxV3CNM7f/JuLE+WMrR72CSpBl+foctjorsP2HxjAkE/2NYemgj2D
	wjxFn3bNqVL4uIFvzUUcUHcE6OjcXOdtD2aP09PEd/IjLF7jDRiqDEDNov6rYBywV7NUPQHxSIT
	Gzm5FWAd/mp3fBfRKOBX99yqnw8=
X-Received: by 2002:a05:600c:888d:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4ba495c2fe5mr18878685e9.9.1794391975803;
        Wed, 11 Nov 2026 02:12:55 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fea745sm124194375e9.10.2026.11.11.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 02:12:55 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
Date: Wed, 11 Nov 2026 11:12:49 +0100
Subject: [PATCH v2 2/2] ASoC: meson: gx-formatter: add lockdep_assert_held
 check
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-gx-formatter-use-spinlock-v2-2-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1220; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vZUPcnmxkAiby0ImBP4p7xGG24J8BAgjSTNkADYSIMA=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlf7Jd0Ttd0+Gv7UCOveuLGBfyZezWL16bIlh+c8LR+d
 v+dqRrpHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIXAOG/1mGURtdjiyrbC57
 s7r5XsGPhnn+m40Dlt9qvtLML16S/4CR4Wq+vt6UL3Nrmtf+C/zyRbZZdreH3MHvwXftHDpvXHz
 zgxMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

The documentation of 'struct gx_formatter_ops' states that
formatter's callbacks for enable/disable/prepare are called with the
spinlock held. Validate this by adding 'lockdep_assert_held()' in
'gx_formatter_enable'/'gx_formatter_disable'.

Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-formatter.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/meson/gx-formatter.c b/sound/soc/meson/gx-formatter.c
index d3bc0c6c81cd..46efe34e84e1 100644
--- a/sound/soc/meson/gx-formatter.c
+++ b/sound/soc/meson/gx-formatter.c
@@ -22,6 +22,8 @@ static int gx_formatter_enable(struct gx_formatter *formatter)
 {
 	int ret;
 
+	lockdep_assert_held(&formatter->stream->lock);
+
 	/* Do nothing if the formatter is already enabled */
 	if (formatter->enabled)
 		return 0;
@@ -46,6 +48,8 @@ static int gx_formatter_enable(struct gx_formatter *formatter)
 
 static void gx_formatter_disable(struct gx_formatter *formatter)
 {
+	lockdep_assert_held(&formatter->stream->lock);
+
 	/* Do nothing if the formatter is already disabled */
 	if (!formatter->enabled)
 		return;

-- 
2.47.3

