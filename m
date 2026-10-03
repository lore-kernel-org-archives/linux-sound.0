Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D32384CC3
	for <linux-sound@vger.kernel.org>; Sat,  3 Oct 2026 01:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991261; cv=none; b=j4etBAyUkehJpHJeF8pKyx3bqoTdMeOe4W+L0LNkckRy/0aMQAsi9dQVxop7RcbgryTzTaxi2sQ+P29W6Y6wXWzWGJRgSUBY1TU9DtjD/FnLEHIr9vTRbsmvSk4J3H23ZuQkNHZAOPxQLMXQ862bxp3bhxOeBkmoDV5Vv6mTjSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991261; c=relaxed/simple;
	bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=liC167OTsHIljnqwjKXAUKddT+mAqSzdWi9QWPcOWeXrpdnXUrwYX1tnf+r9tT/1aTirT9fHSyJz6vlJ4OmHMJD4iIiRx5/4Prinh/t3l4YaQ56/w4XGpv+65A2jG7WGdQEYGXJAa3BQcIBIg88eEK4jxos/b/ANPnjVyQlSzHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rBCeeAxM; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rBCeeAxM"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-3a49573b8bdso59579a91.2
        for <linux-sound@vger.kernel.org>; Fri, 02 Oct 2026 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790991259; x=1791596059; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=rBCeeAxMVC5Sef65H9vBQgzgLJ5Iuz5i+u9KP9ZbsgkVaF9IVCmziTpiZO/K7/kw8B
         ffZspoG0G6QjEvUiqLsLAJnKas3xCiyfcS4QAA71Oy18uQMPt90KFNAQ8/umj/+0Qf8o
         8HyRhH+TRthDfw0dnR2tJUzymmnT7Mnn8I3qABpkvuRbS80y8j5hDEOsplYfClY1lgfJ
         KAiCmCxNnYa/UZjLposP5NPjFzjCIqzK1PiGauuxavqhiDK0hVySvtzt/vQoI9TYTINh
         nHaqu+iIJG5nlbXV2v4GRVvNcVubHzSZHt2ZcnwJnZPYYrhenlLhohil3wjArpXuzwK8
         j8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790991259; x=1791596059;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcN4JKaX3uG/6QlpJtazZDraUxMMRgZ4+sja8nBc76w=;
        b=RWY29w0ade/OC4MRZMUbed4selWWfJu/Q79RtoRc9uLqaW9im4zSNAPQhlDaqiBJ1j
         yP8WfLVJGNFT4/lo7BBiVp8l2JxJ7kuK4st/f/VhjkIjqgK3yjOdSgk4E+pwcI7BbBZg
         Cv3L/wYSmDgTaSwTaTS5Wh/zPKSPXu6XLKdin8XWyqEW22oUu0GWzm944pgEN7VdAmpi
         xyf8YHRZuBb7V8qFJicYu4mzQkpRKHTAEXoe2edKP9XG5Tq8kYRfsde9bufBcc0A+Gvj
         wb3ENbSd5EslwsBBVEIAEQtO/e6cmC+gfo2Ib4RdA2hHgApC8rE596wqJSNftC7nRYyF
         qRjA==
X-Forwarded-Encrypted: i=1; AKwUvBxdXo5KxTKfxw/UfsPy+8AdAcXtjci8AITDtp4ZVD2Q6GoFDSRLqvSxQYXmcoo5p2Y6TsePVGSJBI+6vg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVGX0rTht2OBNpWtLG2gSXoqlV+WCxJCbB7p5jqd6duSn53G3l
	tNBCQSQQRwrpz4t3G3cFZ4m52SVVJmXZLwed2CCegYqsYQLYpf3E0oiu
X-Gm-Gg: AYBFou0hPWeUrYWf64rGlbkBpzS5P8MC6s6lXqBanSh4A1Wu4V7/V7oVDZ6Cmtf5U8F
	UZlaljzwk8ZHR5hccpkL8D5HV4LfSsHO3t8ZrKXei18BDfaRqQqvluUGAO07CG5bqbQeQPLkeq6
	QgV8d7nmvybDnsqw9CQi9PmrZe7QcbEMUz/wexUkawZEWe1ZfLtNC5JyuHm5g2v8CAiv07h/hkP
	tGO1Q2PSLRFZ0MovgQfMfYzDJ/TGHnPXHPsJaWmjNkMVyC9Mb2s5iuw1RxCRuFlvJJmoZsYQjYz
	8lFQWRBdI9fJlt4uTonZVzOsc3rFPsD433MZ5qhVRC2SS/ZH4DkL/uxuSDhQmNXKV8pAfXvNLYA
	3J6GpUsB5pd5oNwTcMqa7krezN67sfbV+x0h0d4jBUEVuTR/I7ExCFZwgqe/zqJ/LWLuyAp6LbW
	NVsOxOWQyfPzxY7vxO25c1DalhormEm+0V+GuZxqMB1hmlDZd4ZnbHWo+xpEyIjrr/4RqzDgUEd
	9C1ocyarbe/VMA1EHJ/RHsd9Mmr5OlJ0lnm2Lgo04K7+94WFYwpont3BV3nH5UY6RTachK6/74O
	LQ3PZkleQn9xoEj5UGueaYLxX3u/5Ay5mZG5f1oPimeykgxwScc=
X-Received: by 2002:a17:90b:3c44:b0:39e:6c6a:6577 with SMTP id 98e67ed59e1d1-3a6ced75f41mr3500888a91.58.1790991258652;
        Fri, 02 Oct 2026 18:34:18 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78e4664ebsm861575a91.7.2026.10.02.18.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 18:34:17 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 James Schulman <james.schulman@cirrus.com>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.de>,
 linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>
Subject:
 Re: [PATCH 08/28] ALSA: control: Add kcontrol callbacks for lock/unlock
Date: Sat, 03 Oct 2026 11:34:07 +1000
Message-ID: <u9VW29vaRPGENsSTq9RHUg@gmail.com>
In-Reply-To: <878q4k2xl0.wl-tiwai@suse.de>
References:
 <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
 <20260920-macaudio-v1-8-741cc20a74e5@gmail.com> <878q4k2xl0.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Tuesday, 29 September 2026 7:52:59=E2=80=AFpm Australian Eastern Standar=
d Time=20
Takashi Iwai wrote:
> On Sun, 20 Sep 2026 06:53:47 +0200,
>=20
> James Calligeros wrote:
> > From: Hector Martin <marcan@marcan.st>
> >=20
> > This allows drivers to implement policy around locking/unlocking
> > controls, such as enforcing that a group of controls may only be locked
> > by the same process/file, and taking actions when the controls
> > lock/unlock (such as granting special access on lock and resetting
> > values on unlock).
> >=20
> > This is, in particular, useful to implement volume safety controls, such
> > that only a particular process (that locks controls and completes a
> > handshake) may increase volumes above a given safe limit. It also allows
> > the volume to be automatically lowered if that process dies (which will
> > trigger an implicit unlock).
> >=20
> > Signed-off-by: Hector Martin <marcan@marcan.st>
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
>=20
> This doesn't sound like a good approach to me, and this looks rather
> irrelevant with the purpose of the series.

I'm not sure what you mean by it being irrelevant. A significant portion
of the machine driver is dedicated to implementing safety interlocks based
on the functionality added via this patch. It would be impossible to prevent
badly-behaving users{,pace} from defeating the safety guarantees made by
speakersafetyd (and thus permanently damaging the machine) without giving
speakersafetd exclusive ownership over the safety interlock kcontrol.

Is there something specific about this approach that you do not like?

>=20
> thanks,
>=20
> Takashi

James




