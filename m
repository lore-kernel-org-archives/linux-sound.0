Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E86982866
	for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783851880; cv=pass; b=cqpjbcBeW20hntjiefyJOTdW4/O4ZpVoHIDMX+kopg4dNkc2uHrXWxdZ62NsBSzfzivlK9u5ErXDYAADScr8a3o+KMrKoi0TxFAnJNvPN+FXfcnGWrPc7dmiF1KBhMuAJv3I5z8Mcw8dDEvHmsF6G2kwgzpAhk1yHGaTlgZtyg8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783851880; c=relaxed/simple;
	bh=gO5G/WXSXTxf11dmOatF9hQcCgto02cM5ALw1laq7M4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A9AqW1xCg6MkxlvOyMH5xTAhkZ7KeELP6vl/q4vP8/L5DtYfj+vf632ByqXSU/HKX+tmX29qXaI8rd/Q5/HuMcLkdEiAgcSo+HmTNp8AFIg/jFaA9xcKClBwdP7kEJ571WEIJMnvQjSTdnnHge5eKNX2wSOMi6IDmL94JJVz7CE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pDojmsfC; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pDojmsfC"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-382a3fe0d28so2225805a91.0
        for <linux-sound@vger.kernel.org>; Sun, 12 Jul 2026 03:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783851879; cv=none;
        d=google.com; s=arc-20260327;
        b=ZA8ks8Z4JAoIoICvJGe7xyXDi1kwwbVaHlAICuak8zBRHTQw4ArjQcLaQEeVVPFz7v
         Nbu7ZwSzNo7OrkRdUvG7iMx3bnnzq/UgCa4pw+60NJpGkz9NJRquHqtIBWtDO6d5jAh2
         BbR/Cd4PLHBQ6Uthem4Kgc4z0Vyshdon50IfHgGSTxPPwtZGaHxyBIQRZ19DuFdFjgOU
         fwN9MSdDpVvm+uaYuvvn1L7c8Kr+ynUf6eFg/EmDmNIJCwAolzUNj+iN/2JIQwioQ4xe
         2Ji/XJp4zFb+SP52yE0E30OggrMSK6zDnWGyxJ3TtLroGLFABXtrguEnIl+GkDBSBXSk
         SmUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        fh=KjqODV2ZbtxeobkO8JL1XK+0b42tHGKixHGJytA9ac8=;
        b=rr5oVaZPcrO3vJqAt0NhBUOEVG1kEZv5sId37VSJRvcY1TUsZQe64IXLmPvQPV1MS7
         VBid4PKG4S14pDUDSuf/o/7tl4KlFLB75i8fk6TJb1i36B8/zb846d5btCj4gn8iA47b
         KudfyNlabcWKl5Ct1wQziprnTP4fMXPyCsczdqWw3wLRNlKbuEBth2ikFgpeY80cad/L
         KiWYvH67EXL+PBiwlMw103gZLkP92uE2e9Jugs0WxxNN9mVll89pKRQL/JAH8nn+EDUN
         fH7IeB/Us27Yy4zix+w81aQZC/UZyP690yOBPvUcqdRs8eoAF7rRyZrd26JYGh2HVLGN
         H4hw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783851879; x=1784456679; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=pDojmsfCyAf1iddwjq5DD/IOfHlu8KFqD3TattARpnKgLeHJ5lCelqhBDyIT0WWxRh
         WnaSDVwYtOX41l396rd7RyEMVyu1vdzEwKiKrqX/k5e4NmXLqnHKDAwLr1q3NoETg6nR
         ukgDR0uoT6uCAR3O6SxsehprSjOqLTJCVidTYFz1Idjl4qlKko8jSJQH+s+vr8qPgX2C
         pca7mIt7AF5vWWpRXL/KOO+3n6sZ17KjpWAj5rMjGuO4nNLDnJnwLg1M8roTPjF6FFkW
         a7H8qhLYBnIp4TgaKn4Xuk1V/gOaX5Sfpmz/vGibucPCUDALqnCyn+YrNHWLH/z6WkWk
         SQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783851879; x=1784456679;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1kmJekbqg8mqqKhSlzLKHynlucPECKPOwWa1aC6qzM=;
        b=D+WcJj04QpxPN0fQTlMNrKtabXTQF03Mcu7gutS3TJrRcuP1s6bwWAeZXI+MjBpgFL
         tVQxZFHGinSieuElGZ6nH2FjSBmCgUgSZoX3gxbs9UHCGeMOQ8MFp4/alPrJBeBlxTFt
         +DqGl8c0PODoQlUIg/C3n5QE6ioeFTlL9OqbvrQ2zBqbpcUPZnFDNqcis+EtA0N++EN7
         Vj6TaZycESH6C7pC3fheMpH7+gcHCrKYNEjJYqxUXQD18Q+gNqJSsXXuJcJRVfcGtbAv
         XTNIz3kjkEyZqPpfEOLPn47D4gnsh0XWuKLQCm1+cMpCzbRrCoh71VYap+FAv5vQg5uj
         Xs2w==
X-Forwarded-Encrypted: i=1; AHgh+RrDVzQaNmSI8LCfh1j9172A8SpIEIM24D5LI/SNWxT1M7jhQIFCb0RIVZJ7hsw78AqZzAqRsBifz3JkCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFLmcioOTR6s6OvMGa+qM5gs0vP+ukZvLOlPeQmZB0sipuCplf
	xPC74SwMnF4WmR2QYBDE6bVLwFqlc9RL5Me/D55HgmeSjUhJoUE1x0+yxne9Lc857xAZmfCMVty
	Pq74FzEYL2dIkkU8fIQ7RvFzaNh/voy8=
X-Gm-Gg: AfdE7ckuKSDJUnBjH7lf3gkbua1bNSAQovgz9LAUUrAegrxacYbHfeWhX+VaitqiRGJ
	hHm6Py9yq2RsnlEJiFwsOUjaDnrbnixvOluGRir5U/9LEuUw4PNl7rKIfusWUAFWL+xbbZ/nzer
	/5lGH616H/ZZ2/2bL+dyhlNXiZY0CTsLOW3XBPCnarSSV9mAT7dFVjHHGKsT/JmTsALLHVnLPzh
	xfgelp49YIaRM0+zhwyE51oPT8yYk32KDxicsCl/q6edPxF2zLXidjslku1QqwbwY/cdTeomWk2
	MUtK3E6qd0cw0czRm3eOwGsg04YDMRjpcac90n+7wA7IQsyLkPEVg9hUnZtTpQ==
X-Received: by 2002:a17:90b:3846:b0:381:1fd3:e4ef with SMTP id
 98e67ed59e1d1-38dc774cd1bmr4524877a91.25.1783851878641; Sun, 12 Jul 2026
 03:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
 <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
In-Reply-To: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 12 Jul 2026 17:24:27 +0700
X-Gm-Features: AVVi8Cca40gsSncc4EvdD5aUN3fJc8X0TaVsh-jOUWXPUjZCZtF3SWItFvK7afQ
Message-ID: <CAABR9nHKCYvev=owQVw2sisGRiQPc5gFcW8d2O3RvhsRn_Sr+w@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

While looking into removing the goto label in rt712_sdca_dev_resume(),
I dug a bit deeper into regcache_sync() and how it manages the
cache_dirty flag. I'd like to share the analysis and propose a small patch
for review.

1. cache_dirty state before the out: label in regcache_sync()
Before the out: block, cache_dirty can only be in one of two states:
+ true: if writing the patch or the sync itself failed partway through.
+ false: either it was already false from the start, or =E2=80=94 after the=
 patch
   has been applied successfully (i.e. the patch loop didn't jump to goto
   out) =E2=80=94 the subsequent sync() call also returns success (ret =3D=
=3D 0).
=E2=86=92 The logic here is sound and consistent.

2. cache_dirty state after the out: label in regcache_sync()
If _regmap_write() fails when re-pushing the paging register here,
none of its three error paths (-EIO, regcache_write() failure,
or map->reg_write() failure) touch cache_dirty.
Only the cache_only success path touches cache_dirty.
So cache_dirty simply keeps whatever value it already had before out:
(as described above), even though this write genuinely failed.

3. Proposed patch
-------------
ret =3D _regmap_write(map, this->selector_reg, i);
if (ret !=3D 0) {
        dev_err(map->dev, "Failed to write %x =3D %x: %d\n",
                      this->selector_reg, i, ret);
+      map->cache_dirty =3D true;
        break;
}
--------------
This ensures cache_dirty correctly reflects a real cache/hardware
mismatch whenever this write fails.

Feedback welcome before I submit the formal patch.

Best regards,
Phuc
