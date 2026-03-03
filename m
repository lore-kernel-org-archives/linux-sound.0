Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3E32C21F0
	for <linux-sound@vger.kernel.org>; Tue,  3 Mar 2026 09:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772529061; cv=none; b=c/az7CQwgVykqodeM1U1+Q/Hr63o/jxwarvAkCZ2u9HwaEvGYEtCb36fUjRqWwZh4F5aM3dxJF8rJus2WCPTILMNhY1+SoorB/m5CWk2OWqAA91XdljHjoHhR119EVYZVzGXLZapzE1+QNf/GcA2k9F2+6/bQC9u3ot7FX1LASQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772529061; c=relaxed/simple;
	bh=w8Kx1qlt4D62VcByjefxrRx2gnqxk8TlOdvwp54Diog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gM2MnfO3rHmg4CP6McwktNeCq330wtwnNSdHX+QFldg2eKV7vNHJxrdssv3NvxLih9lJdzJYbq7ismj227kUAgFvi5YKdwnr3s3IDo04UNmmZn6qQxdeb7NQp1Vmq6U4Vhsxic+xBTG45DPSrO1GwfOuhH74JlYa6ah0e5kSvLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEDM+6nt; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEDM+6nt"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-827390e8a3cso3512798b3a.0
        for <linux-sound@vger.kernel.org>; Tue, 03 Mar 2026 01:10:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772529059; x=1773133859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=kEDM+6ntM9yXf82/Pl5V1bxXXUkGZskBg96YLCjFQJHINTh/T5iumYkLkzUgsnZyml
         aumbsRO+xRW9Wm3uMQAd07b54yfAsghyfNPRENQpDqCinVhpGUJqb+g3BsrZK40SWhoM
         qRwyOTUSzwpeT3lgrJT0p01xXXQzMLOslX/4vnzioPgHxB+4EIQEEo8AfKtvlNionTpB
         FmNV2WhKhSUdckbkYp4+lIyaE9vYYfn98Gwyp4siijvqjpVaEUCwPMHgATIBz/K8vUA+
         k3QVJUh71S9PjnPfZ+My8fkZQRJFSXoXHsjjsRgzgVsnwicUZNgI/yWNIWaTs6r3KAFv
         HiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772529059; x=1773133859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ieqeIgWXtsJGqN9iYbh1K+fW5zi5u0kpmcIzoP8Jzk=;
        b=NjIoRajBsOEXWsEaSpIbefkr5U6vjrtl7sTeflJELLboipN6LiZT8XjoEXmbGEygr2
         mU79llJ/pEJsOvVNThytXavUqziidsqRgFX3n1PHmfdBPBAX4w5kROao59fTtqXEeHkJ
         nQnRj/v7tiuKwSBJvu5ZDOheg74D4dHtvqdTJXqcV17D8w6VgikaX18fjmwZwUr0OQff
         wFOMyoaqUrPqVG2yQNqO7n87u7bB9YTzO0JOlK1ma8EGa8VlAli1ScOg2Hf7nSOvuarG
         ERTsXfPdyVyXA0UOBa9BLEh0UeVK9gbel+es8NoU+VASG+mn4/gw48PyhwAqUPiHxNmM
         XxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVC6dBNEduEsXx3E1guw1ICLBDhPWbnGk+zSp03PHz5vETzntMGerJJ0Dx6IHeXTtFEHl2yIqStwy78yA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPG2/OHJ8PV/4ZzR2ZfFfyDnmaSAMdeZBr5/4gZPZPTmouZlK
	+EWxKEa6CJ3yOdhlmJY91yQlSrJ/xVR5lUw9+dguGmCdJTzDQr9E4Har
X-Gm-Gg: ATEYQzx1dq+JsR7B1iNReix+C9W0+d4o38qnmwLhnrgZvp1L7BqBGrfXqxApS0S7Xof
	rH3Tdhj7Lcj1c8IN1OPUIYeaNmrnP2kkCM/lnIhLEBgNN8waE6S6Xhqus7/yWwb9q9mh+nNYrsA
	mWjuDnhv1MGmtW+WOokfgomNU08V0ZVfVpOajqCgg20tdSl/Md6Pe0GYYW6XXhry4FVjLrapL6c
	KyybbxrkrrLeG/+1VwzhoC3pSuGEKFyK0yUJW9sQYuMBSLzY7/yHw6pFvvSQYRdEAKWWeqTykch
	xvD+45g/llglIgO/Dr0l81QuON7uyhuz0UQYSS/vsQfrgJ+lFdNbi2ICRLS9twyLxs4cmT9sYj+
	8e2FeAA25gDk4hwehOdxnQzEmphtCWn0FCGkxHEYYcWNcBMMVtsWNCoJ8Jj4u+1CVtTp0Zfk7Ob
	AtPhk1Aeo34iiiILj8kKxv2CIL6cgOUyyyPl1awMiSlX38NvsdhYi1hBpDKzkTPl3wr570O6iV3
	7lV+om7Jqcsi2QcznZqThT2+47aaqK7u5tr1h8N9mDyY9QwysVjnjrO54azKJ9+S432RlP4Ih+C
	spU=
X-Received: by 2002:a05:6a00:1ad4:b0:825:2927:3aa6 with SMTP id d2e1a72fcca58-8295d82a9abmr1551612b3a.14.1772529059400;
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739db4955sm16000114b3a.29.2026.03.03.01.10.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 01:10:59 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Frank Li <Frank.Li@nxp.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
Subject:
 Re: [PATCH v3 5/7] ASoC: soc-dai: add common operation to set TDM idle mode
Date: Tue, 03 Mar 2026 19:10:49 +1000
Message-ID: <4716405.LvFx2qVVIh@setsuna>
In-Reply-To: <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
References:
 <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-5-c6ac5351489a@gmail.com>
 <877brtacgp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Kuniori,

On Tuesday, 3 March 2026 12:11:50=E2=80=AFpm Australian Eastern Standard Ti=
me Kuninori=20
Morimoto wrote:
> > +int snd_soc_dai_set_tdm_idle(struct snd_soc_dai *dai,
> > +			     unsigned int tx_mask, unsigned int rx_mask,
> > +			     int tx_mode, int rx_mode);
>=20
> Do we need "rx_mode" ?
> Only "tx_mode" is enough if my understanding was correct.

=46or our (Asahi) purposes yes, we only require TX. However, TAS2770 also
has a bus keeper on SDIN, and I suspect other hardware may too. Rather than
break the API later on should the need to configure this arise,
I decided to add the capability now. I am happy to get rid of it if
we think it is superfluous at this time though.

> This patch-set adds new snd_soc_dai_set_tdm_idle(), but no one is calling
> it. Who use it ??

Currently no one in tree consumes this API, and it is likely that no one wi=
ll
until we submit our platform driver. See the linked resources in the cover
letter for more details.

In the interests of transparency, I don't expect to have the
platform driver ready for submission any time soon; it is a bit of a mess
and given that I did not write most of it I still need to wrap my head
around why certain decisions were made during its design. However, we
are 100% committed to getting it merged at some point.

If you would prefer I can resubmit this series along with the driver
once it is ready, so that there is an example consumer for the API.

Regards,

James Calligeros


