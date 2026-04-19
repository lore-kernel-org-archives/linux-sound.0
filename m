Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A726F2B9
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 20:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776630693; cv=none; b=KnjsWA6lFOJyySGjxftbDXTxrWu1aDori9UZ/Dtmr8AYuh/ShO6xWkQgRJxVYIx5EIK39Q7RxB2OQZkIjYjn2ybclIniA1AKX9Iv5DQZr2dzfgEZQEFJmromQ2j95g+DU29XMPO3Yr6cuM7fh9KwvDwwc5yp4f4n+/GDxR7Xrxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776630693; c=relaxed/simple;
	bh=FWL9iHDXSYoluckJLB911JktohnLlx+Aco9CRYvp9OA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m5ThKr1/2tlTf47hoYtTnxyVcGIOEMFEtmx9r1hBHXEwYTByGJxqO0QMeSB9rzcUESRAfjjTSGEh6r/FP5LvX2AUNDLIPUUGJEaOrbbzWTMadCPBB9tc1bIpja+WTAYJ3aAGNfwj116QLcky+iISqSbtUJX2hi18iBTYjXls36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NeYA0Uzv; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NeYA0Uzv"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2dedf5f88adso1290498eec.1
        for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 13:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776630692; x=1777235492; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adKZuyxQZ1V1TuZoH3DUI0I4OUtCX6ISr2mcieCFENA=;
        b=NeYA0UzvCEP/CZ/zLr1rpcWe/E+FTlnyr0wmDkQAyEAlTOxqsngZKziEtZ0YMcGg3p
         a0R1gRs8kSokBOeABiUFIaCJtjuUfncgdIy4J1I7kKP1HAd3ZevGKnVu3gwNP+9nUa6i
         E/oCcsJR4BpFvG4odaZQLrWb+paEeGBdXn1k+hla5kr4UeOx9W88xytWfkY/Zeaqpt6L
         6BxIMie81iqyMxI0Ri85J51yC9CnporLktnIkmwGam02XgkvPsxotKhxOVwOlXSbTCxi
         yVwtPPWuqIztaooWlippGGTyOa7qh0CP/anhpJSdf4qMERYVUeW9KtOLF8Hv9JrcKjcX
         ESQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776630692; x=1777235492;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=adKZuyxQZ1V1TuZoH3DUI0I4OUtCX6ISr2mcieCFENA=;
        b=ICMoLwAdbk/Bt98ujHBjsFxsGjlJzu5QJASd2TnZh1T9RyAgKJeoPT1rknsgWnzrB+
         2/CNZ65NIvK2RR+7nIwWAJrhIR/1TeuaYO7o+ZAlBil1rqzQQnjxHFfmb/9NjHDHgxx/
         /6ukR5XFVomVRZiRHzuovUehpjJW79p5X+qwhIONS9BUlQ206aDkw0o/jyBy/y1MuI3j
         cD9Cfq6+Dng5N6I2TPB4egzTpf5CfI2Flw5kGpV6r+mVl1eIkOGL2OEHWInMowh7e5Sk
         5f+ETqnpSwXZUgs7w4LvJ/oEjXZCic1wSTZr4drLtObtmxjs5XUR5BIHfj7RO2r/VHwX
         cZJg==
X-Gm-Message-State: AOJu0YxefLMZq4sjO2PxUBdlrt9d9SVnshqn2fFF9TZU8KXuB4xk27pQ
	ZP2iildt3mFm0lFzZTBtBvGm/rhPqoDi9zxwvbb5c3doruWNUy4iepxs
X-Gm-Gg: AeBDiesQJrHpSRU31MRKn1hUxdStYrbQuMvl94GOe/AQ9w3iVgeos+pbNIVpq222iUE
	l0DlV7ybRBqLW8gXiTPIW/CeJO2cyaZPYd4xNREmd8+aHs+Whaouq8cHY7KU7mxTX4jjvnTo3eB
	gGwSd2WQEszIbatcN48HhxG82xB8/sP9nXDnExDQ43htzbsijsWmPcrmqOUPfWdyh48jsARXkda
	WBeHBG8iq8k8pSnw/oagEglYwGeZkpR7u661skSP052ftr39jXjZM+uD68xZdzHC7uaG9GNEZNO
	26CsPIW1L4Gx7FmQGsfldgD51gwD/EZu0KX7OgyjcgGi+hnQuEC6iOodMlU0NucFu3uXzM7Qm+j
	2dhSpsctWMECBPKwfSOBKHrkMuE7vjMY1Oz0u+JpiNndCUY4ukNpaZJK9/GiA+xa2UzRHuX/x4Q
	9Mh+obT4zdeUFul2IoXlw9U/sSzlg6rKMuoz114ySTUIacnXtCABvtn/edHKJcVkoy3nww4osvZ
	sQSR2Lh4OihWIs=
X-Received: by 2002:a05:7301:1909:b0:2dc:e6fa:317 with SMTP id 5a478bee46e88-2e42dbffd65mr3036275eec.11.1776630691763;
        Sun, 19 Apr 2026 13:31:31 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm11419096eec.13.2026.04.19.13.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 13:31:31 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 19 Apr 2026 17:30:30 -0300
Subject: [PATCH 2/4] ALSA: usb-audio: Propagate errors in
 scarlett_ctl_enum_put()
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-usb-write-error-propagation-v1-2-5a3bd4a673ae@gmail.com>
References: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
In-Reply-To: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Chris J Arges <chris.j.arges@canonical.com>, 
 Detlef Urban <onkel@paraair.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1134;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=FWL9iHDXSYoluckJLB911JktohnLlx+Aco9CRYvp9OA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlPrWd2H2+4PG8yo8H0aN5O7S9WC6UTizm+r5Lj4W34+
 EFj2ZGwjhIWBjEuBlkxRZbVSYss93Q9uFoft8IDZg4rE8gQBi5OAZiIXxsjw9UVi8Pv6xom/DCe
 k6HXo7TXRsYlQbxykXTHoUohjRmWGxm+KRh8sHjdPmcvO9uzXVp9u179EQ+q8Di/6LlM9ibbsDP
 cAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

scarlett_ctl_enum_put() ignores the return value from
snd_usb_set_cur_mix_value() and reports success whenever the
requested enum value differs from the current one.

If the SET_CUR request fails, the callback still returns success even
though neither the hardware state nor the cached mixer value changed.

Fixes: 76b188c4b370 ("ALSA: usb-audio: Scarlett mixer interface for 6i6, 18i6, 18i8 and 18i20")
Cc: stable@vger.kernel.org
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer_scarlett.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_scarlett.c b/sound/usb/mixer_scarlett.c
index 1bb01e827654..673eb8d8724d 100644
--- a/sound/usb/mixer_scarlett.c
+++ b/sound/usb/mixer_scarlett.c
@@ -680,7 +680,9 @@ static int scarlett_ctl_enum_put(struct snd_kcontrol *kctl,
 	val = ucontrol->value.integer.value[0];
 	val = val + opt->start;
 	if (val != oval) {
-		snd_usb_set_cur_mix_value(elem, 0, 0, val);
+		err = snd_usb_set_cur_mix_value(elem, 0, 0, val);
+		if (err < 0)
+			return err;
 		return 1;
 	}
 	return 0;

-- 
2.53.0

