Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.166
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793648495;
	b=OZR/v3E23uec3QHb97uxdELVZPFG+EOAksCRXfWpyWDEumdSyAg5CajjJnaIlxp1vMYA
	 O0xcnP4oXPdtLS+DqDfSHVq1M8j599kfR4PoBbRR+Utlis/WcYOgOw7u8tEGpKT1Cz27D
	 3xknIQc73ySQDyTAhqgZDzTkrCvSfphpAmsABELqvwnR7FAkrT9v92AyzIevo3abElS2Z
	 8q8HiVuiMMxuyYmKPiC2aaNfmjLZ+FYwdkGNpwqFTrMmjcU+3CV4bslyMznTkDdSiYPmm
	 b5XaiH2UHSKy6Z5Vu1itqGvkoeoc0YP/ZQlgB+IyvnAmWUQyMkF8AdTcJDH1F7j1DDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648495;
	h=DMARC-Filter:DKIM-Signature:Date:In-Reply-To:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:From:To:Cc:Message-ID:
	 References:X-SimpleLogin-Type:X-SimpleLogin-EmailLog-ID:
	 X-SimpleLogin-Want-Signing;
	bh=IH9t8292dHT+5iRnRuCTQeBS2dibh5hu4FM4clq4gA0=;
	b=wRacEtcfM9nTNoMqpwhPrFkjTZouBoWCYCYSNne+jkrx0ddRBL1EBgBnm/SGO8H2mFDb
	 YekQdRuciZTVsnKVBvMQepVbsWFrSSIPFDCp6FZ8btk8GP/sjC6GBs2Mdz+5tutJ0JDjv
	 Npf+D34dxZpZIgItMvrjn+OREvAH/KcCuiVey8Efmiq9ltZ8PFonj4SLqKaaXDvtwTqOX
	 ZEYKu4R9Bdh9TcRLrn7EA0GZ5oUQVF2J3vqEJfxjiTPSSEg73/wgIGWATJskz9sGuEJ6O
	 NfhwH2yeUprSkYz2ffw/TGfHeWOdQQ5ab4dlRn4J4bsLwIAmIHuH3MkyLS/9QAdQGPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=8alias.com;
	spf=pass smtp.mailfrom=8alias.com;
	dkim=pass header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=SjtSqfEB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=176.119.200.166
Received: from mail-200166.simplelogin.co (mail-200166.simplelogin.co [176.119.200.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD80606A33D
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 19:41:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD80606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=8alias.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8alias.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=8alias.com header.i=@8alias.com header.a=rsa-sha256 header.s=dkim header.b=SjtSqfEB
ARC-Seal: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626; t=1793648493;
	cv=none; b=uPs9lVoXkyMf9ey0POG7sbkZYy+CeqZeM+MP37nYPgsC/qcOPxogpz5RHEiH+1d9IUgeiqplGNmI8YI1boWRYytFgdrdS84vl9MtNG0H1Lw3o64Y9ZbTjfnFh1Z8p0Vh1jbUn/o9slDd5e5jz6AaMXf94tRseqDtFbx+K/hQnZTmk4+13l/8x6QqALSomiOrlfAjsN0bthsbZiK4aP2IhooyHTZHoF93NsKWsV4tcZ6y8cjXiA0kUd0QDHJdia2k68qTqfPBQBSnPecXENeFuqV8vF9Yns36fM9JNOdllypmSV1EPtfqk+G897m/YqUUzaVynGedrtzCYBPrlnb97g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=simplelogin.co; s=arc-20230626;
	t=1793648493; c=relaxed/simple;
	bh=IH9t8292dHT+5iRnRuCTQeBS2dibh5hu4FM4clq4gA0=;
	h=Date:In-Reply-To:Subject:From:To:Cc:References; b=tDCwZxFllohKqPftqqUmI/PbW9IQgiqxqEqxR6E1ewAPRACy3vRahnP5tvTro0k5GImcGD4HXQb4oaPeh35c2UradawNZfBukq6C/pS24WNYagrmz1MJKvnkGuEkcb1uitIJyp24cmUojf/E2bKBrzWBm1i79IpynDZ5Y4ihiKxPkHBdGfxpfJ0CsaIYheRIdLYNdfADVcl2Es8TCueSeHQ0dCWxXSC41UPYLi/BLzKOLqqd1H75C/atloW98NdsSOu0Y9HZhUzzaNFWl+WLXX95k8TaLzSdnWH5WdCTCEZwusCIsRW7Xr7+GXo1bGzA8IfP+NbhmCENCbfIOZeS7w==
ARC-Authentication-Results: i=1; mail.protonmail.ch
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=8alias.com; s=dkim;
	t=1793648492;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IH9t8292dHT+5iRnRuCTQeBS2dibh5hu4FM4clq4gA0=;
	b=SjtSqfEBwTGD8tuu/QT2Z3b4kzKe7RrTzUYzNyD2dMlFMzqJR5LyW35+LEtjfW+t71UCPy
	DdTi5vwN9T6IpaNHve7ylgU2gmBNJWEBSBEoM3NnAw+c0Pf0eHXSAoo5h5++SLHV+3vUlL
	2X+ntKdGDzgZQvCFSDUyF1MnfLsdwFc=
Date: Mon, 2 Nov 2026 20:41:29 +0100 (CET)
In-Reply-To: 
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
From: linux-kernel.supreme403@8alias.com
To: Antheas Kapenekakis <lkml@antheas.dev>
Cc: Shenghao Ding
 <shenghao-ding@ti.com>,tiwai@suse.com,perex@perex.cz,baojun.xu@ti.com,kevin-lu@ti.com,sen@ti.com,matthew.schwartz@linux.dev,linux-sound@vger.kernel.org,linux-kernel@vger.kernel.org
Message-ID: <179364849173.6.15547077920953953013.1741098232@8alias.com>
References: <20261102174052.1216670-1-lkml@antheas.dev>
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
X-SimpleLogin-Type: Reply
X-SimpleLogin-EmailLog-ID: 1741098254
X-SimpleLogin-Want-Signing: yes


Hi Antheas,


Confirmed working on ASUS TP3407SA with Linux 6.18.59. The speakers work fi=
ne with the patch.


I=E2=80=99d prefer to keep using assembledev for privacy. If that isn=E2=80=
=99t acceptable for Reported-by or Tested-by, please leave those tags out.



Thanks,
assembledev




Nov 2, 2026, 19:13 by lkml_at_antheas_dev_itvnlo@simplelogin.co:

> Apologies, I forgot to cc you.
>
> Test and report back.
>
> Antheas
>
>


