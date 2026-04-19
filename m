Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEA63093D8
	for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 20:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776630690; cv=none; b=PR0/TZu/iGP6o1mN5KBaffxSkIWQvjOkSCcZ+T5fmPuUb1cC+lu2HFEN8WVSsiZcY+jtg6LT0mdVotkIjtoxmz/Fl5WaWj2ywgcEOYtwdagKlzAfJuR/hBIn1AbzWAbMcCsJKZM9NvpDJXB6f5rHtCHv3Yptu8SoAPkJxt2fHUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776630690; c=relaxed/simple;
	bh=P4weKcVi00t8c3FrT0ZGr8asxcuixapoIDKdFDWxtqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IRhXgN0pxt5UKphhWnCqdjcsc/LiaitZ8EhrZ4Dsqy9xJC0d5OOh43XLRLkwQbaoxUnVmmhRQYCQvHZwHuXQhl0kr4q0+rSz+2Y5eRfSrkorvn+3G6L9avnfypfF0S4mjCQ7YBOttT2AsuwR9/817+N4FDXzUVspVYrJDTEnsgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lXtdTN1+; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lXtdTN1+"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so2183529eec.1
        for <linux-sound@vger.kernel.org>; Sun, 19 Apr 2026 13:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776630688; x=1777235488; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tn6tLwXqEiX4RdZMDh5f+mmnzYxq73K+CVdhjiXHL3g=;
        b=lXtdTN1+U6sPwgKpniepdJKnq3ie9lc9YmzTr2ZCp8SafW48ivUax1fs0wcnppZIcX
         gp7zKKx9E+AF2+ciH/CElYFd/M2SsACm9Vxr0DMxHc3AOTipgDnSvfnZslCMW/85rxp+
         MtFdtq3+s13dCJZF0xz+RxyDgbvLSBy6WdMjO4yg0awL9RbozsmbBOQGk9Uu0Qe3HYJp
         9C1c/MyxYvV4DgeEhSnocOaBuj64Efsnd3sj03MbpPOmCQW0dpjC4Ws64Z5NCcKyWmJ/
         G9mID/OQiHnl+vcKoMxhmMDF581ZYE5nIEFHAg9OiRQWff03L2e4Q5ES/E5EWkTfv7/K
         SJng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776630688; x=1777235488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tn6tLwXqEiX4RdZMDh5f+mmnzYxq73K+CVdhjiXHL3g=;
        b=YPVLAb/8c59FaxdSlFy5Dq2jU3QPSWph0HZRS8JVkms4Fke5aPWPHaO5ha3WUBc0fd
         Cso1WFlykBK1Wj2IRqmJZYQSYypqu2DGzxC5smBFrWtDQmv8K1dsx6rhSS8UPZXwKJEp
         IsKGjh7f2FY0LSXVGakAggITlU8HWpSkmo6NywE3vXayo2GLpfi+kXIGA5QwpPt4kspC
         pf7qp/5vkX4PbXUOzKHTn48x9rfhh3lKNhzWTCicatIyJGm8+SIbGNF2fenb0SG9Fpkf
         3KDIgTrHlC56wvF51/Z4Z2svc+RCDTJqYTxhrKU/lu+vuATanroS9m7R+ahtwh+l67fU
         2Z8Q==
X-Gm-Message-State: AOJu0YzIGoipbZG/ofq8lCPu68PWqQcO/sBp319GMukurttCC8sv0+QT
	ILPLWtfnsFkMW6eenUtKOseGKMb0rNZ893VXTcE8tPbgeT/N2cp+r60Q
X-Gm-Gg: AeBDietHX0qP/Vi2glfudJxPYXeeiBJzKQiVo0FRqs1azwQY9BLnN/FWvK76K9zODbq
	a2PwycAUh3gUjt6KqcJSagbbv1jJVK1I7XG/yfWwSHPv19oXBflGj5B1pVyZdivNVB+mDyltff4
	7cYnXsdwoCwiqGmmTfMJ6Bo8MWwGRnE7jN/49VqD4KRdkSOAanWcoHALkT4isloTFU3gmuuwix4
	CLrbwusAeE5mSEHi1jRhfNOkLOQS0ZmWO0wAsg/fvuFPn48mzocOjlI6dJD+Xk4kgPxQz69Vkgu
	NDZkpApEMyWbD6e+6AYKuZ0zDsss4TITlyGkb2gKGJNarVOCTYHX0VCwO/Yr/5x006s8yaYrMBW
	iCZliCHbXAlHFHl/p/V4MfjcSBJgA27worWLyZ8DhSFdtSHa4jX/Xg7KdCua6YbcC0WU7auZnji
	bYi0y7/a04kU6JQm0AH9Ks6HzpwLlLLR1XT5hxnlB2EHOCTYmir4H96LV1NQT6hbvAAGnIVt8sy
	aPfBUixZzPmrfvfIa8CMt0osg==
X-Received: by 2002:a05:7300:6c28:b0:2da:9a3c:8062 with SMTP id 5a478bee46e88-2e479c042cbmr6224720eec.17.1776630688482;
        Sun, 19 Apr 2026 13:31:28 -0700 (PDT)
Received: from [192.168.1.18] (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ac84c38sm11419096eec.13.2026.04.19.13.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 13:31:28 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sun, 19 Apr 2026 17:30:29 -0300
Subject: [PATCH 1/4] ALSA: usb-audio: Propagate write errors in generic
 mixer put callbacks
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260419-usb-write-error-propagation-v1-1-5a3bd4a673ae@gmail.com>
References: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
In-Reply-To: <20260419-usb-write-error-propagation-v1-0-5a3bd4a673ae@gmail.com>
To: Takashi Iwai <tiwai@suse.com>, 
 Chris J Arges <chris.j.arges@canonical.com>, 
 Detlef Urban <onkel@paraair.de>, Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2274;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=P4weKcVi00t8c3FrT0ZGr8asxcuixapoIDKdFDWxtqM=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlPrWeG8hmaTprjvs79ExOPkV22kmSyVLVulcl2e5+Pn
 23yvX06SlkYxLgYZMUUWVYnLbLc0/Xgan3cCg+YOaxMIEMYuDgFYCJ3FzP801kdx9aWJ6fHXFb+
 eWVHsa3Jw6TfKtea+Bje/rP56/D7HcN/52MsG61UzkyLWudx8HDY9BYvn+e/1+qZCy8WmO/RLv2
 MCwA=
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

mixer_ctl_feature_put(), mixer_ctl_procunit_put(), and
mixer_ctl_selector_put() ignore failures from their SET_CUR helper
routines and report the control as changed whenever the requested
value differs from the current one.

If the device rejects the write, userspace still sees success although
the hardware state did not change. Propagate write failures instead,
using filter_error() so ignore_ctl_error keeps the same semantics as
the existing get paths.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/usb/mixer.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 85653112e7f3..9d9ed68166c8 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1526,7 +1526,10 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 				return -EINVAL;
 			val = get_abs_value(cval, val);
 			if (oval != val) {
-				snd_usb_set_cur_mix_value(cval, c + 1, cnt, val);
+				err = snd_usb_set_cur_mix_value(cval, c + 1,
+								cnt, val);
+				if (err < 0)
+					return filter_error(cval, err);
 				changed = 1;
 			}
 			cnt++;
@@ -1541,7 +1544,9 @@ static int mixer_ctl_feature_put(struct snd_kcontrol *kcontrol,
 			return -EINVAL;
 		val = get_abs_value(cval, val);
 		if (val != oval) {
-			snd_usb_set_cur_mix_value(cval, 0, 0, val);
+			err = snd_usb_set_cur_mix_value(cval, 0, 0, val);
+			if (err < 0)
+				return filter_error(cval, err);
 			changed = 1;
 		}
 	}
@@ -2466,7 +2471,9 @@ static int mixer_ctl_procunit_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	val = get_abs_value(cval, val);
 	if (val != oval) {
-		set_cur_ctl_value(cval, cval->control << 8, val);
+		err = set_cur_ctl_value(cval, cval->control << 8, val);
+		if (err < 0)
+			return filter_error(cval, err);
 		return 1;
 	}
 	return 0;
@@ -2832,7 +2839,9 @@ static int mixer_ctl_selector_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	val = get_abs_value(cval, val);
 	if (val != oval) {
-		set_cur_ctl_value(cval, cval->control << 8, val);
+		err = set_cur_ctl_value(cval, cval->control << 8, val);
+		if (err < 0)
+			return filter_error(cval, err);
 		return 1;
 	}
 	return 0;

-- 
2.53.0

