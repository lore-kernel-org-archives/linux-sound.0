Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF43119C55E;
	Mon, 30 Dec 2024 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735552395; cv=none; b=V9pNi4mWnvkw4BPd1J58QbnijluI0S906eGli8PKZWwvV4ECAM4OWTLzC7XM4jHlzG9EpRECaXuvXJ8NUmuT58Tm1G5WBElpR3HvoZcc/ie3W+B7kWsxl1KKSzmnzetB1gWWAz9yA5jXLBgtJ3JUv66Mv1TySzl7tHeC6FBSQ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735552395; c=relaxed/simple;
	bh=u/oQt620w8lbrW6/uX3hWH2WcOyT8LgDAgPnHtyeQuY=;
	h=From:Content-Type:Mime-Version:Subject:Date:In-Reply-To:Cc:
	 References:Message-Id; b=fSVcAYPDUsFROqyWZ2OE21Kuu+q6NAP1RXSBjtPBOf0isNxlhcdRHjMe7PLvmGXrPjDt09yymbVydgqgTlvvppkk6Qb30gCC2R9ryPa7LZL9A8FyI1EChSxRXJQccgheErht19qQWvHZdJATSirOtWpt8q+T+HkreLiW8ufk87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn; spf=pass smtp.mailfrom=m.fudan.edu.cn; dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b=vO5TXe14; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.fudan.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=m.fudan.edu.cn header.i=@m.fudan.edu.cn header.b="vO5TXe14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=m.fudan.edu.cn;
	s=sorc2401; t=1735552379;
	bh=xa4Qln6W/vOLlfwyPuH70oAvcZZRrROT+CgZaYKQsJI=;
	h=From:Mime-Version:Subject:Date:Message-Id;
	b=vO5TXe14S5Uq53NHjyS6kqzZDOXDCq31uZF5U340XkskGU0xMiZD639vv+PN+2uDf
	 wpBq6l3z7GFbiqoVRHFk8WnCnveon0G1YurVvgnwwHn5Ww1ZzB1dQicZiOmJHDF2fH
	 gJ3AFPfAJsiRVhpmgLn2PwUDMyT4Tabez6C1QsRA=
X-QQ-mid: bizesmtpip4t1735552375t5rcfwj
X-QQ-Originating-IP: rkdmQkG3j9YUA/5MCSTumCPYZYudHmBPB5YMtfhmGVw=
Received: from smtpclient.apple ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Dec 2024 17:52:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13645203710116740504
From: Kun Hu <huk23@m.fudan.edu.cn>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: Bug: slab-out-of-bounds in snd_seq_oss_synth_sysex
Date: Mon, 30 Dec 2024 17:52:43 +0800
In-Reply-To: <87ed1qydgi.wl-tiwai@suse.de>
Cc: linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <2B7E93E4-B13A-4AE4-8E87-306A8EE9BBB7@m.fudan.edu.cn>
 <B1CA9370-9EFE-4854-B8F7-435E0B9276C6@m.fudan.edu.cn>
 <87ed1qydgi.wl-tiwai@suse.de>
Message-Id: <3EF6B9AD-36BD-459F-A59A-B8E875D8E32C@m.fudan.edu.cn>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:m.fudan.edu.cn:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: NYH+ffWV0WmstUvxfqE6j7hy+ZtGxFx5hJzsNjZJBZyh5D9QQ3jVgki5
	pE7cwwEXCO6bbVYoiMDz/Nkg3YE0WFQFk6gbw5zYl/5RSx4w370ErqkGrj5MXaD5gpR/o3p
	gx+eQtZG+g7h1sdpGC2Sjyosf11tACsEXoLDEcirNzfWbLCg0ceYDyZeL1pcqP4QpPCNqBi
	YhqqykH9+o9fxdhkDAS5XKK88r0cL1plcinbbziJEsT9rwcTdnJ+OfVwuuw8cYYlgrZtSZj
	ErC57zP/h3lXuLeVRoK2gmXYVQ2b76dpd4/9ImhMgsPBACsRYg0Vhy/5lj507CsbHcjioX5
	BQD7FB+4vxFsv/cH6++IAKqetRRwovCTs1OK2Sd9HZD8FyCK7/z2VcsCs+Pa6o2BNNYXaOO
	hA3sSPR/TC2yvJ4r6zJBrO2K56+I4OZWfqewjQDq+Z7gbz0QV+pZIxh3XLKxz0/0FoucPYb
	1Sb4iVVeYs9kQMlpi1QTkwLrmpgKq8RBkGBZCl64sGqHFPTxh8ppz1IgPrzLEAUcdWc93OY
	aAPIVQbyTC6IU2Ms3Sk75iTKwnFJc2ATJF+EDCpwLYZ41+Wlu34UARpdGBjNgbflio8F10q
	AGSGzkNR9Qu9FnYF9/yg0MJYxJwoxHMZp4chGEur0IvFGBGKR8vaaLoQp9AuH089+v4UWbx
	7VoZH3J2R4PtbqvwHungiT2G4XOhBGzFeLIJ1Tnxz26x6pueH1gZ7S1Swo5tzJbmsQRb1y8
	nC9ergUI5XisaT+feLQjqO+SHksRjcwVTKcOCrrkDb1GetOJBXSvKTDmrDleczySBqrfbcg
	YUgO1/JkLoZOult9iZy7VbzvN4Nz5CVLocpZQ8Hllspp7S6Il8MI4wuzD1Jfi67J3T8C8c8
	9SE4Vacy1hVWeOvuuboZ0Tx/JExmg6BXDVbVh6idyARupUGY68W1dhsykQG3pxdEUN9vk2C
	4ggWOzNs9p3/dZzSTBU79rp1aRlTAlKqQXzJQ9VTJKVlljSrkadM0P6wS/oTEESA4HiEi6A
	lsN3iNQg==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

>=20
> The only place incrementing sysex->len is that loop and it has already
> the bounce check which resets sysex->len to 0.  That is, the likely
> reason of the buffer overflow is rather the racy calls of this
> function.
>=20
> If so, a potential fix would be rather to protect the concurrency,
> e.g. a simplest form is something like below.
> Could you check whether it addresses your problem?
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> -- 8< --
> --- a/sound/core/seq/oss/seq_oss_synth.c
> +++ b/sound/core/seq/oss/seq_oss_synth.c
> @@ -66,6 +66,7 @@ static struct seq_oss_synth midi_synth_dev =3D {
> };
>=20
> static DEFINE_SPINLOCK(register_lock);
> +static DEFINE_MUTEX(sysex_mutex);
>=20
> /*
>  * prototypes
> @@ -497,6 +498,7 @@ snd_seq_oss_synth_sysex(struct seq_oss_devinfo =
*dp, int dev, unsigned char *buf,
> if (!info)
> return -ENXIO;
>=20
> + guard(mutex)(&sysex_mutex);
> sysex =3D info->sysex;
> if (sysex =3D=3D NULL) {
> sysex =3D kzalloc(sizeof(*sysex), GFP_KERNEL);

Hi,

I did a lot of reproduction testing and it was very easy to reproduce =
before the lock was added, after the lock was added the error was no =
longer reproducible.

Thanks,
Kun Hu

