Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ED65474E;
	Wed, 10 Jun 2026 07:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781075417; cv=none; b=mxxytkBxAiypP/60uPI+5ktrTNnsu5bvDKXKsO7kThuQ9V8naZO6RSKPLZwYlwOM1nk4/ZO59eQMCMSv1lHuaY4sdD6eA4XjO+nOlJWdjbbuS6ncc6J7yOTdKVFxk8mHhlIHTCHAJ4SXfBKDirTtB3nx7/l9pOe20Xx64yfw4kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781075417; c=relaxed/simple;
	bh=3zRlAFrXum4KHexWBikSOYwPrqsjd9veSpk/WdIuW1U=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f83iwaZIK6poWsUlHE1XBG+Mha+nj4/7k674gPpaV5NziGDmnx5m3yj/UNAo9loiuQJFAA2H598N6scc6DN98euCTRZLvNlNIqousGN4lN2IjFA6UgWLiEQg7N7awgHhZLfN16k/KlCaopsHyTm94MF0Sp75bfq+cfB02S1j4DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=kKKMvI2Q; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="kKKMvI2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1781075409;
	bh=W7OpuSrG0GuoIIG27ajTyQnrF9WKw8EAYPOKYSEgAZ4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kKKMvI2Q9nFTe7RvN56GpWTFII7vY3M8xYDafMQ5djrYroPifmXLUfA/sWhmPvBjX
	 +xzmOKAnJNLLPB8i4LecSt7/nMoGVLz050JWyH4Ka8j4Oplvhxj5O8NERbrRId1w5Z
	 5qFGJkTj+dlfcPixG2Nf9npCvpJs8g0JMoWhEWgE=
Received: from localhost.localdomain ([116.128.244.169])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2878A03E; Wed, 10 Jun 2026 15:10:07 +0800
X-QQ-mid: xmsmtpt1781075407t0sb8jsfj
Message-ID: <tencent_6876EEAE19042E61EDC877BAC5573731A208@qq.com>
X-QQ-XMAILINFO: Nh+XzM4m2f2HamxQCESNQU+pbSzpsFbZfumzBvVOxgINVVT0Mstl+vL8ZVZW2D
	 xH9Y+bWwj52Uvwyy+RDaeED/FJn/J8wZ2odpl/DZ0Wry81jqsd+xdo2MjTB2dASMgYDKR6ZN5+vI
	 8eAlZNF3dRHEFbTE8L4aZ2cO8J+pZBtAOBbKIDqgzfryTLDtpPcznLSSgGBgg/OpS1uXXgGcOmc9
	 RcVixALcPs12MDZQH+5mibFXWoWqx0qUARDxkLeVOOzzP3lmm48czHgSLwaRWHF60DS3o4bHH3w+
	 R7Y7rRvShiQ4FMkjZYBST/QgLRLgy1+vEJpbswFAlkO1fYcZeQDLjePO0DhkCfwRAHzV/77gbQ41
	 htS1CvryeC6XXLNatW0cNMFg/KBot5+gSR2iT8vnCHVyheM2M8ILmAGyrvz2GeHi1Ld04QhLhBj/
	 bGgQJpg5pYLpHAPS/u3PPdhGVQkIgNqSoLps6jB3DYOWr/oUKUIjhYy3IlTwE5zNvpXRowGkRpHI
	 OI82crM8Zn0RLbisyFbLZXfstyB+c21720IFiKqQiXEBwucIG00VRXXnhJ8ZL7QzfmzENnICJqvO
	 5aCcewTpPJTVTr93qS3t0TuiCGlVeKKRvwBi+3hN6kDp04LFvxVW9abxrUgPcUv02Ez/touiWMfL
	 H4/m2b70ZpuPCaUuISrJv1RLth7vsyqFoks/av02bvYsa+8CQCk1UeG4wEaGrifkbtg7/gv/oIKR
	 aXbepVQlY7uoxmMNYxp54eAab2TjKEwBhM40QFBebRew4H1eP3AoM0Nk6AvEzSeL5c3drGEXSiNH
	 8uAxNliJlyXKJf2cWQl6SppQxTgB3uWM1WLEzsrk5j1K4ZGqJ9ZldGGcwX3JJlDP5KVdDu0C6P+j
	 rYE4K/jwbNklugvTDhRR0BZSKTkPih2ixwJKLoDfrqJt+tKQTiS+vJyqfEBbrsgHXzu6cTTGwsac
	 AyQ/a1O4MTZJX5KC8bYZuwgGtcU6KZPP7k0nrFMalr+aJ0WMK2X/lMvTK0rBGSke6mVcGZqoy3P+
	 EUbaaiBgHb0kAq/hzyXlcI7CIMXm8veG8jhFgT+KpiU7d9gf5u6WnqaPvsb2IkBKZDZNJs+6MMoI
	 Yb2UoqKKCtcYe2Xhti4z/0DPJPcQ==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Zhao Dongdong <winter91@foxmail.com>
To: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	daniel.baluta@nxp.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: SOF: topology: fix memory leak in
Date: Wed, 10 Jun 2026 15:09:53 +0800
X-OQ-MSGID: <20260610070953.327055-1-winter91@foxmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d4059b90-ba44-4c51-bdd0-0b791f1a5fd4@linux.intel.com>
References: <d4059b90-ba44-4c51-bdd0-0b791f1a5fd4@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Wed, 10 Jun 2026 09:58:13 +0300, =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com> wrote:
>
>
>
> On 10/06/2026 06:11, Zhao Dongdong wrote:
> > From: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > 
> > When the topology filename contains "dummy" and tplg_cnt is 0, the
> > function returns -EINVAL directly without freeing the tplg_files
> > allocated by kcalloc() at line 2497. This leaks memory on every
> > such topology load attempt.
> > 
> > Fix this by setting ret = -EINVAL and jumping to the out: label,
> > which already handles the kfree(tplg_files) cleanup.
> > 
> > Fixes: 99c159279c6d ("ASoC: SOF: don't check the existence of dummy topology")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>
> > ---
> >  sound/soc/sof/topology.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> > index 63d582c65891..09d6dc01814c 100644
> > --- a/sound/soc/sof/topology.c
> > +++ b/sound/soc/sof/topology.c
> > @@ -2534,7 +2534,8 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
> >  		if (strstr(file, "dummy")) {
> >  			dev_err(scomp->dev,
> >  				"Function topology is required, please upgrade sof-firmware\n");
> > -			return -EINVAL;
> > +			ret = -EINVAL;
> > +			goto out;
>
> I think adding
> kfree(tplg_files);
> before the return would look better and align better with the code, here
> we are sure that led controls have not been created.
>
> >  		}
> >  		tplg_files[0] = file;
> >  		tplg_cnt = 1;
>
> -- 
> Péter

Thanks for your review.
I will send v2 patch.


-- 
Regards,
    Zhao Dongdong

