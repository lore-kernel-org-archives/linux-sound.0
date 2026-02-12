Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98378223DFF
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 02:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770865181; cv=pass; b=oUcV2qcRc+CeWtzC82VH71o9Gzbuw9axus56VX1Z+WcN36CzSO9RUXC+gFTr6Ob9DDVVatwxMOGVhSrwbJ1Eyrlwxw8Ik/YOwO88R+6TJn7SSgf8abZteYD/zhvLk3RIgN6ksx5xTRX3664KMBIqe10oWlbuTW4LA/haVzuP9Gw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770865181; c=relaxed/simple;
	bh=x9a2hZ52SmberyGno3xnZYEkBEKYMXD7eSMO2SI9Yig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fwA6NOzB+V2OCE5mXKyRLQCq9nGhpL6Y5NtjXY3gwaKMuHmifOBbKB6vOsKTjGztFRW29iBEvtNqlLcHHVeQwsD+pR8BNVtIy0uzp+y3PigE0SceYV2fnXS8sCLvWbNlToQQA9QlSnwtWm9FQy2EpkrEOGmRGOIi6iITcLWrU/E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=APYMAsQo; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="APYMAsQo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c6c444e89bcso996265a12.2
        for <linux-sound@vger.kernel.org>; Wed, 11 Feb 2026 18:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770865180; cv=none;
        d=google.com; s=arc-20240605;
        b=Raus/zvryrL4gQtnDtuLtRAMzbZq+GrlUjO3qdE45eD5dDhf4MjZMeQ1k3Lt7M3tth
         piEO7bvQI1TJ9Tj0gjJM5PHt0GgdFuD1xryjYhcE5+I+EDnq0YBoIyhEexoq871wTI1m
         oNi6d2L++zvj0VKsfvKD9m91UZ9w5KeVUzX0SCfPxwvQe107JkWmzzZSyqXIgg1nWpmc
         lhIBkPuGTver77FTHBr9v3DyazK3T6NJJtWPOwdKVnhYnUkWzPVb9VeVPjfMaFvZyu3R
         PzOibN73nP0m1SxMa1okXjb94/I6jPH8UMoroobg+UdXED6ZpKDr405B+GsiUBLK3kE0
         4TCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tviEcHcVwOtLn+XYr3KdxbUUmkmcPdARSTxnGt4x3FY=;
        fh=Xtp81uYx3ht40najAUer0kdH+bJtflL7n2+btKJaZLY=;
        b=WbM9MnvN+G+/87NQFJwLehiv9ybac3EPJjnhEbiViRHnTR1Qijr2P8oZyU47L0dh3V
         ycHLqvDIoVZ/x3gxnzfTfLmurLRoSNsFKA8hoAu4v/F3lcvQj8RWS/cQgJWmkhXGfExU
         ROuwX87P9Yk9LGvFcwM5qD33qBAJwTODf5IKAK2Ekv0zEbCb8cJwn22wbsNe6cfLQO8I
         I7kI3Cec7XXC9px15MTR6XwBrlf86zV2xrnQe0aC6+OP/Fzx362Rf1ted271c+M28uI9
         F6sxXXsGatCYmj64Ae7WCF1qkLyynVm6PzR9uJLIVjm9ORX9fl7EJALaB3c30CGKBX0I
         ryZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770865180; x=1771469980; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tviEcHcVwOtLn+XYr3KdxbUUmkmcPdARSTxnGt4x3FY=;
        b=APYMAsQoRaTEG+h2BRbRWFWYg5Z8XfTKafM/a2bDv+iwxL7G5RM7ZIwxR/CTMJaShu
         BmJ5LsBtXNCJUEd/ZDRlPAysQwXOo2/uxoezVpkG3aq2S0CkvUsHZKCJpSvxWUxY2XJ+
         yVr3xAu2G5LgyRmcJ0+2LyF5VTGu3B4eGkt3VYgnqKto6ZPt3HGz+teAGN9B8VRCaYgS
         3Zvy/h/2LuIFqpyGwPA1U50FRToe6NUuZLX9XiKbf19G0TFXfszMHUHahABNjZjsPZ5+
         zQpK485bXoMTmDMZLSxHCREKu4evlwJ/1nJFM57uyWbWErILVE2kmsHLptJrwLWOYgZB
         c89Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770865180; x=1771469980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tviEcHcVwOtLn+XYr3KdxbUUmkmcPdARSTxnGt4x3FY=;
        b=jJ7XaqHx+KrA1uc8ax89SsvDzmfCiIONlVclmcxCTyoxNlzRso7UZHpZZOey0e5/Jx
         fl7xCs3qWwJt5xAGygaQBglYVWo/Ucp0XfU37a5eFXUp32VdZdwKJIdE0YaPaq81AIUe
         GM0egSXeinYt560OaDQjECOYn/xtCVQNlSdW0t4zcRWVyL5WelEGjdzzXBZPOnKDb7w5
         05CoKCjNPDH1Z0VhtMy7h8Vxb2vgIBLPo/zhGSW1XE865c+T9PqFzqo50VfPPZ/kgd6C
         30BprzpEX67pl31ob14jJ4DoQe44VYOH7RWEdNaBbhXp/Cn8R22XX+pimJaQXpSsCMfp
         dHmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJflV2k3ra8+zNyRMNX9QwLrC5M9h2FyTPb4pbh9Unb2OX/76J1mzlYa/SlJVmc7+EAvTz1PhaS7KEoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkWZwbVgD3HjZIxDHQ6IO8RmyWs2kthQGeYBoA/Uz2/BKdylLx
	Lw0yHxfNDAj0CgT5ApTMM7pfQ6s0yKLwik3r2TV9XBqNDG0Ak2qvDfttaK+ZDo+7KV4ELNOOFyb
	SKOkhpgnoTInr/v5xiJkzvVYtacOEHng=
X-Gm-Gg: AZuq6aK2z/yW1eRnUxXpN5+4OMsPYkCdeinxDboluiaIKFLHO7+zGpCHORt14PhNYzE
	FkK8rloSApOXhbKpT2vv51foNEPRjbxydBAsVQfwHUNhTrrkZ95kJqyjyOHI9jnYjugqw88GRlm
	ZSmxpDvl3woR+mhmRavbuN1uu1Mrh+bwpQxqyAwb66Esy6Ti3zZbRALPZHVVPdQNneK0sgOUFKU
	PQEWgtMQ+mDgog7Eo4+gACV08eqVXAjKCXhuK4s5RB9GNElvoihRKDbyvc0ikqWgcVdWUzluPAZ
	IdurM3w=
X-Received: by 2002:a17:903:178e:b0:2aa:f7a2:25a5 with SMTP id
 d9443c01a7336-2ab3b2b39ccmr9288495ad.60.1770865179884; Wed, 11 Feb 2026
 18:59:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
 <20260211093527.2892297-2-shengjiu.wang@nxp.com> <20260211215346.GA3958740-robh@kernel.org>
 <CAA+D8AOTgp9Oi3puOdZv4oYTHGBVHtgbBRV-U10hzMJMpQbBJQ@mail.gmail.com> <CAL_Jsq+8j7bc4_GPdx+-8_HMTT=WyO8aiF+uwV-CgLMrCtsP3A@mail.gmail.com>
In-Reply-To: <CAL_Jsq+8j7bc4_GPdx+-8_HMTT=WyO8aiF+uwV-CgLMrCtsP3A@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 12 Feb 2026 10:59:25 +0800
X-Gm-Features: AZwV_QilGiOPADPc2TJFKuim16af3Oz7rjsy26r-4g6qjq00vNVltbWgFl_0ovI
Message-ID: <CAA+D8APsagF=Mxavnp8Aso5C1voUKA954b==ViQ17SnBfJbYAw@mail.gmail.com>
Subject: Re: [PATCH 1/3] ASoC: dt-bindings: asahi-kasei,ak4458: set unevaluatedProperties:false
To: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, perex@perex.cz, 
	tiwai@suse.com, ckeepax@opensource.cirrus.com, 
	andriy.shevchenko@linux.intel.com, nichen@iscas.ac.cn, 
	kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 10:38=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Wed, Feb 11, 2026 at 7:44=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmai=
l.com> wrote:
> >
> > On Thu, Feb 12, 2026 at 5:53=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Wed, Feb 11, 2026 at 05:35:25PM +0800, Shengjiu Wang wrote:
> > > > When including the dai-common.yaml, should use unevaluatedPropertie=
s:false
> > > > according to writing-bindings.rst.
> > >
> > > Generally true, but not always. Do you have an actual problem? The on=
ly
> > > possible problem is you want to use "sound-name-prefix" property.
> > > Otherwise, you don't need this.
> >
> > Yes, I want to use "sound-name-prefix" and "#sound-dai-cells".
>
> Then please say that in the commit message. It's not really a fix
> unless "sound-name-prefix" was already used.

Yes,  v2 has been sent.
Thanks.

Best regards
Shengjiu Wang
>
> Rob
