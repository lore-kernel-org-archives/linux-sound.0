Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E9219AD5C
	for <linux-sound@vger.kernel.org>; Wed, 22 Apr 2026 01:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776820077; cv=none; b=Sht7uIhL9pUaOlrEh/5BwEby/7Yy0T33KX14qMs7PonTIPcuIwGeEaRnoOuBm3CivrKoWK7z40JxqHSssGJ6zbx1OhXAeWV8VALsPj7vDm5APjiKl1rGFSWd4FD5cWFCncQoAIc8eVc5hcUiZ4QvkcBNj11qus+L4GUaoPmpuy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776820077; c=relaxed/simple;
	bh=DmvQdbnSVkU390Uki7nhoRgUGLW/SfBTGzh+vLC9FdE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Jr6DsSNUytmHXXR4g/jGYodbfTRwLsS7xreyX4kg38o1lbDX6dU/wiUoncJIdnHisstyU6CqnSs/R99vY3MPxhwLO+ae71d7aFhmS+NubuT0zXFWxfIiZ4w4yFlKNg25zia/hElpmcIsLTfBW6JztX2DLyOrRgmxQ6XGVNPl8q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECrmDrMS; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECrmDrMS"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12db2e415a7so903473c88.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 18:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776820075; x=1777424875; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UAr7c0jVgzuAHNJ5czeyIB1hhcntc/AZfRD30ixgZSs=;
        b=ECrmDrMSyjgggLD1EG7dgg7XKM8x51S4Ct46jhfFB4zWlwF0skale0ssqnKvs/5dGs
         pgpEz2X+gP7ub8DqT9xUfLurepXeTnldvekth5E3zDjvlaqZN/Gb0hf/Klse003Gaiq5
         6Zg4QPGJs9AZSrHAX1myMO4YJv5nxj5YNSyU8u/58IzEBQyw7eQyYyLfPzzODLQe+sFC
         ctB0uW2AK83DvRfeF3caF7KCF+T/RUKJnfjOqFlGm+j7iBkO+8g+03M6F9T4Zv6BF4HY
         Wdefd4CbTG83Z8c7unYu+94aIJA8HL3cpK4vY8LxMAeNWjfYIXzjaEszK83Q0opk7wWh
         pHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776820075; x=1777424875;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAr7c0jVgzuAHNJ5czeyIB1hhcntc/AZfRD30ixgZSs=;
        b=R2D3Muo+9rmHfBVHNpEDJ33pPX6HyceTVf3k5ZAtapAzMqy0doyj81MZ5k5PAUKKTB
         jlNcTFOWFfzrWrlreSOXFjKj+NgftjIBDgmNzzo+Pvql6oUxHzzBYk+oMKqlQLi1cuJM
         eKE5EqfM4jfeE2UXxbdBAtljqUYDBWmBGuH9lGR7lt/rGt8fNOr+jo7CqbwOmSl081lD
         YScaM4zLwGGYwD6ZafgDf+MoaQp3sNixmnFGqYB8xM4YdrGLgoiiWgi8bpT7KQJYdtnO
         MdTq3kVVl/RzfDLHuNl9UqRjX+s6Zm40AYNeo/9Yr5WOCkdBHNse4JHzNKLlTn92q69U
         Zn/A==
X-Gm-Message-State: AOJu0YztzgVwwjl4re+1SjGQZu4Du5Qf2i9mWeSwV/+OY4Hfc4fwrB0o
	9YnixjBUBNIh5RVh7KOwrdW4x3YCFCiONSFX3NVk2uVBxO6VO/6cRjqt
X-Gm-Gg: AeBDievl8BViLrYwvi2w6RGlgCzn4ubo2PSjtHF50NaBuqEaKyO9/DIsiYRNCfLT0rv
	hI6RusSe6c/aIx7yc40YOPJh3js6wLhD8cyR/j69UYu7D1W3avxV5pET32adFfwRDKLy9qJtcHb
	nEU+0/pXAGmWZCQ9Yb2/1AoGPeqHNht0IitPVJXBbc8Fv2m+d8ebZbFk2pBc4JN6mbTkqKCitbv
	5IjYHHiRLOiQMByK0T9B1dNghBiQvQu3QFiA+bgbYBrsFCIXxe9EwaAd+eIWmn5ErwpbL3/aVOh
	s0Ec8SVQcJL6F9oRrPkhVwcz/f9hckt+pN7dudoBdvtx5JQVCF9s6kzYMutXmNovnRurKsxr0fH
	XqsT8MoKLHLdolfvZ43hua3HHp60djcDJf7aT7eyVgM9dzd2VP4mrgjOn3R2jKVHO6h/7gliImc
	sEddCsIJYikG5g6wlzAJsQvaborR0qSF7KqMcEAGs79KRrI+3K9xHcA3rYsNK92cUSNizFDjsw3
	H1JpNI13hP+k1qjIzAzlXM=
X-Received: by 2002:a05:7022:ef09:b0:12a:6b99:1ad4 with SMTP id a92af1059eb24-12c73f6c3c6mr11619846c88.11.1776820075248;
        Tue, 21 Apr 2026 18:07:55 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c919266f6sm12358283c88.1.2026.04.21.18.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 18:07:54 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 21 Apr 2026 22:07:41 -0300
Subject: [PATCH] ALSA: usb-audio: Fix Audio Advantage Micro II SPDIF switch
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260421-microii-spdif-switch-fix-v1-1-5c50dc28b88f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMUQqDMBCE4avIPnfBpGq1VxEfarLWKVQlq60g3
 r2pPn4D82+kEiBK92SjIB8oxiHCXBJy/WN4CsNHk01tkWbmxm+4MAKsk0fH+sXseu6wcuXLtrC
 muuZlTvE+BYnzka6b07q0L3Hzv0f7/gPWlx8VfAAAAA==
X-Change-ID: 20260417-microii-spdif-switch-fix-9d8b62193585
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1283;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=DmvQdbnSVkU390Uki7nhoRgUGLW/SfBTGzh+vLC9FdE=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJkv5NPPu15ZNsl05XWBA/VxjtMLQvf9OmkVoSFyesu2p
 aVduz7YdZSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBE/hcxMnQcSvWctF4ibx5/
 omDc6vsTitc+ufDR75jYF46cLI4Nh64w/JVqvLuHUXFtUsH7JYKLrzufmCcdpBGyoynj456fE7Z
 XbeEFAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

snd_microii_spdif_switch_put() returns 0 when the requested
vendor register value differs from the cached one.

This comparison was inverted by the resume-support conversion,
so real SPDIF switch toggles are ignored while no-op writes still
issue SET_CUR and report success.

Return early only when the requested value matches the cached one.

Fixes: 288673beae6c ("ALSA: usb-audio: Add resume support for MicroII SPDIF ctls")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index a01510a855c2..6cd50cfc563b 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2025,7 +2025,7 @@ static int snd_microii_spdif_switch_put(struct snd_kcontrol *kcontrol,
 	int err;
 
 	reg = ucontrol->value.integer.value[0] ? 0x28 : 0x2a;
-	if (reg != list->kctl->private_value)
+	if (reg == list->kctl->private_value)
 		return 0;
 
 	kcontrol->private_value = reg;

---
base-commit: 46b0e9075ce97e82726d45ce9b048840d0b4eec7
change-id: 20260417-microii-spdif-switch-fix-9d8b62193585

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

