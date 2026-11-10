Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794289512;
	b=nyBSA4n/UxhHBvmTQWXgVTIvjo+z+5om/FQvmoEeuNWTlBxkgTo6EgvWW1DT3ur+j7lA
	 UmLDNyagYFFpY/ZxnKB+8Ql37joKt2kmoH7KF5BX5rp7i4vtE8ps+QdYFGjMm/aB9G/ko
	 HpiEjAkvaqzFjfPxe1PGCK6JFcgGt/7Alrbuxs7UwQOSPSSMiMuy98FXgOxoXeXMX0LPS
	 3K3S4/k/Smu7ztBDNh7fSetpiwVYfHRjyOGIswI7G3teytsjgYJypRBtdUVSRE0qqR76j
	 vcgEqhKADavz5nq3TpMAhpSczo5+7Jw+UIE55d5Mr8+RAQ3N6lfe8g4kjGxC/e5uxjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794289512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Et+Zb5EdR7iyJthKkThJ4eFs29yWr3uUx0op6Z4LpU4=;
	b=ApzHvuR3VKow0ovsx5efkN9Ruv2Kf3M7HekOm6ocS2Fd4ccKM/7plvPhycI4xrRcpnbz
	 17DMFtn1BxHb55ZrN+Dl+hdw+XmlDeXh2TyxvBpOhRVKG3Eg/3m11zBRK+65yNwAJySqJ
	 VNQWBNYo7RUBWVFN+gqjj/edli9Q+r3xs1oQOqbhBSJpz3ComBmtnJNbLpz78+2xN1cPn
	 0u7dH+ceYbrz87oxfWqsDAIATKl/CuQZLusQlT8JAqcxfcMhb2RXoPPv7zaWrvBIW35V7
	 jPmdjB8/XuRFHxWekVWH+XVnUzM4xvnQOBeU3IfOhxOzoyyvVPql19jQUQ1W3XiDY4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjxUazJX;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B91606A325
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13B91606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wjxUazJX
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36ff9c9da34so2826312eec.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Nov 2026 21:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794289511; x=1794894311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Et+Zb5EdR7iyJthKkThJ4eFs29yWr3uUx0op6Z4LpU4=;
        b=wjxUazJX3FsrAGCWTXLFOUZlYc92KL2tlO9GPsGNDKzm21dwnGGJFJTPdTkzrhE1Da
         O7yVhekIWNpO5UxKE4+PYt1sEetjA0Wbrl3Bkn69NBMIwjUCyi3SFnmZksThjK/imLqG
         L6kVu87FDOmftCamupWn0CnIAa4EhaSsQoOg5oEKHXbV626ag/XrZE+qiO5ANBEdzMYM
         Yz69Zsrcsk1kyL4hkgKvMMGMbxhswuNwgVxmfUyMoiZw0Io1erp0suJVBoO0QnsTiRmU
         o5Z5yjfjLkq+ZfMNxgJEarEQ2F6LamJjqCQsGwEvmArjyvaYcwLUb7qrA08ZJQtRdrKl
         svYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794289511; x=1794894311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Et+Zb5EdR7iyJthKkThJ4eFs29yWr3uUx0op6Z4LpU4=;
        b=u9JwRUzC3cq9i7azKRv2u6KK+yS8y7c0SckPl6KWdcnTIsouPN412O9S+BhX85NyRe
         TqdOcdBxqd5ASCXfZoBRug4B/IbbzZVecgCkfYLPIiRYuRkiDFgoYjysjwmUrc2jQhfZ
         JXVZJMAoxG2gruen2UwbRF9GFfI9D7KgSjP0nftYIMIOEajftR6ESPPoVOE/U/6qb8Bn
         PkIQHGWIXVOfiNaLcoopV+T2jc9BvFUdK+WQlJeNBydfSTb/FYJi6joL4ioW1ssduyqk
         ywyCFWI1Q5LWTU7qkbf+S1HLCIClXzvTH6QxJMK2Gglnr2nqiYjztWZH3vA3lhKysk+v
         Ecrg==
X-Forwarded-Encrypted: i=1; AL+hErFnb/rUbfwzVSf4jbxY44Z/bQNl+Khhx0dBETYuIpNMM9Rr2/TKsUMFpponOxhj7GLbAIBi2yIHRfeYrQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ePBDJeB/PxMAQCA/613C57WT+5fJN91yYppYYFrMHZv8FcR2Y
	MFEGNsfsbfgq4IhsGL/TUlcjjYwe86jzSHpbhY2tHeiN2lavJOObfrA/
X-Gm-Gg: AYBFou15Rs2JdrJvCkc5eOKWpVAnSaLjsq/h+7DKA6yG4mwWYME2RqKzHvFp9ucW+s/
	vRjJphvseTKVKmbp41p5aN1G237rBPF8sq7E+UoYwhaQqFVNFXtjn8yg0YV4NN+dcELJnIKLdg2
	C5eh64BIMhSXpPae/ct8ZNi2BzEzZBfGH9pmM2gqS3eyN0rpOx/4HAvmjkgL4TJzdL5UqEKIm5f
	hQ4xmkazBeoc5LQ0nk9ZdBYqwygSrCgZZOR+JC+D2QJ56wqlugOjYALSsjYW1Wy7WyJvGwnTYg6
	VR/1lNgaqJmkUv+OFvWV7ZC7aO8j4/84cd3hGL6C8C3z1em0/aw2pmzTGZuXYf3h3vKr3WZ/aVW
	kYTay0x0ZV8us114FMmjFwdk4Bs3kWCX0KE/edIgOMyb7iSOc1TNRYczgn7JR4hfZbFm97ouVRD
	uhXMmpERGa8D3EvjnrjveithN6d1rBN/XxQRANk2hsQgLFB6ccBHX+Aw9jyCI7y7HZCdLf5eyKC
	BhsRW1ok/Sp2yfJ1r4Cpym3J0+TiGXIYN2bhDVQoqzR8WECsl9nwTq+x1U3atvtgGvQE9o5BVsM
	PvRAPfmNRW7IjrMis7kQy5NhzJipjaWmScxlWSJdXNeWV15H
X-Received: by 2002:a05:7022:1701:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1b3b6185abamr1807080c88.30.1794289511064;
        Mon, 09 Nov 2026 21:45:11 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751ad6f11csm3466120eec.0.2026.11.09.21.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 21:45:10 -0800 (PST)
From: Hyunjung Ko <hj351016@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] ASoC: ak4613: cancel dummy write work on component removal
Date: Tue, 10 Nov 2026 14:44:53 +0900
Message-ID: <20261110054453.2286414-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
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

ak4613_dai_trigger() schedules priv->dummy_write_work on playback start
to issue the PW_MGMT1/PW_MGMT3 dummy writes from a non-atomic context.
The worker dereferences ak4613_priv and accesses the component over I2C.

priv is allocated with devm_kzalloc() and the component driver has no
remove callback, so nothing cancels the work on unbind. If the device is
unbound while the work is still pending, the worker runs after priv has
been freed by devres, resulting in a use-after-free.

Cancel the work from a component remove callback, which runs while priv
and the component are still valid.

Fixes: 03bbf9f5e4eb ("ASoC: ak4613: call dummy write for PW_MGMT1/3 when Playback")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/ak4613.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 0000000..0000000 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -807,7 +807,15 @@ static int ak4613_resume(struct snd_soc_component *component)
 	return regcache_sync(regmap);
 }

+static void ak4613_remove(struct snd_soc_component *component)
+{
+	struct ak4613_priv *priv = snd_soc_component_get_drvdata(component);
+
+	cancel_work_sync(&priv->dummy_write_work);
+}
+
 static const struct snd_soc_component_driver soc_component_dev_ak4613 = {
+	.remove			= ak4613_remove,
 	.suspend		= ak4613_suspend,
 	.resume			= ak4613_resume,
 	.set_bias_level		= ak4613_set_bias_level,
--
2.43.0
