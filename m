Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B943BB9ED
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 07:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779866132; cv=pass; b=JbzWcDpXdZeqjPtN3lqO/Xx9it/vlnA/+AYbdzkiAzKPQfJW5ezntGj93LrsJTZ2Wfz5etGjO4NR3eKW86FN46pomz6/0ECFtRhJSyLoTJvptoSYs/ixJyES0wWJnUYXLC6mUQFZuxTPamok4yauXz2UlpH9ZwQbZDB1ZY+CRbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779866132; c=relaxed/simple;
	bh=Hj3otYEBw5ZoFUlZ10nDzRDWKgiD9biTbeBS8Z9Xy7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ujcoAJBL+VxeJicZsXfW8+VimVEwPYGekMdC7ftMt/zFdjPqkOpK8ARm4fECpuwD8tm2NAHI4rpSBxwL8OPh8fFJJEMhgL8FbPSOr5TIXouOdXl2PBa/zPD8XvRLMgvgIqYlj+xUx5on3WRNwN+J/C4ahj0wKfPObGSWvIxrpOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3kMMEa0; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3kMMEa0"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-bd5047a2a4cso1736730566b.3
        for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 00:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779866129; cv=none;
        d=google.com; s=arc-20240605;
        b=MYKb9S3P7vVLrsz0e5sb8laGNy9FuvlUy6URGTu+ynIYfoV6I5hZFBB3Hm3SXNVQ64
         HCY+j+sEsCiJgWmdACstE80UuouFP42ljyIf4o/XJxa+5rVXgMnIbAa1yjTJ9X9oTnOo
         Xw2v1x17vqxz/REfq2Swlts8y1P0KLtL+HbsB5aRe0CPznGR17xUJitwkVQCXvyQC23Z
         F2rQdnzxIO013Cu9nQ1cMy/7hhBSAWM9Bag6O/+Gc2kJA3FRkFTRvatkBCAwWgWOgdY0
         j0LI0gUQrVHJLj9pvdNfIGTc/B7mBiZBV4nglh7KqGEiiCJW7Ar1vtsMafK1hAa3fQsn
         XIVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVVcPZ33nAnNko0KyS/478Q9ZYoZ+Vm0Rdqky5x9NgQ=;
        fh=q6DKe8gU3DwZUgQo9qxPCXIn8RJ2uj8oJYJRnq+7fi4=;
        b=SftFmNANtjoYY5lYwHv5ZgGh7k+ygLMH34DQuFog5JpFJpsBFV/eQ0t+Akcl0n4ol2
         SlLU8kM9q2Al2lfJKsqiYPK1FpjbA1o8mu0ga9eTfgcgCP1xv7JAbi+4Q0X3i8iIEzUr
         bh8jJUC3PFkSeOs8iSrfawOHgcWKk5a1RsONL6BOHhMJNMy7qHDupIxrpRQ7zx56xCK/
         IuzE1c8pZq+QGcjlu05CYQ9tLRJmaapbkIwsLitPOt23sl77QDnZFQSUlZcBjV8InM4t
         CiALXfB+jm7B6VWga1Yqh+R77u20VTsGu0YZfTLVf7/mSaiIifVWLGoFLFxoMaoUnOes
         Fg0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779866129; x=1780470929; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVVcPZ33nAnNko0KyS/478Q9ZYoZ+Vm0Rdqky5x9NgQ=;
        b=a3kMMEa00JeNecJ7rMgo7WxCtAom1dVyEQbCkPUnLOHIhxpB5463LorpFNZVZMrM8I
         f4kQJ04pTGzFlcpcCgGkFst8T2rSZEQGe0CbCJzKNnV4X5tg4PE2zdUBx78knZdbt6y/
         kZosn29re1XFLf1BCvlSdiQ3FXvJQryIHcsM+lQcnXCK+I0gCmPgcAaFIQz5M9Tt8qzC
         K3Y3lzWsnhDkHJ5AkjxTiYWkBDdUj/8q6EeuP/F12XjuZ55kEVUIJthAXf6lOjEp+PPN
         SzZdLTVPx91e69jRv2aJbfceA9s7blaLVf1BUPb79jQnitg8f588cB9R0tSaQuIaQRpL
         00Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779866129; x=1780470929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVVcPZ33nAnNko0KyS/478Q9ZYoZ+Vm0Rdqky5x9NgQ=;
        b=AVm25RVp7nXnuWcO7gsuN2hJ7T4RF7u/4bHyBsBSkeKQj4aiBwChSE9hJp5H7F/Cn/
         cpq4yH2p1whab1XyKvQWpWkGAiUFtR2u75Nv+ZsqLcJYxKoCOHOJeU4mUefZadG4/TBj
         iSXesxzkvbuGA6ZY+qKOMq4tpP+q/54cA5S6O39qQPF99450xF/yt6tJPFopIAi17/V+
         DI4RMj94VfPU81yOfoi553ynV54pkkWQMUIo1rVvpcB6P85/1VfjysHwR2NtFjX9w+ZW
         gKBtheP9rc7bBgR23BOLELYNOmkli3EGsTkPddEJeZRWVSQFDvn+247kU8SoBDOEo/Wt
         WvMA==
X-Forwarded-Encrypted: i=1; AFNElJ9h53JX97KSSAxaQrprz5Qm2T4C9sB8Ofdu4/AEJhoa/Gq63LtIhNfxr7ZuFHoB77Eu5kYPZqyXQPjHPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWHj+0J+yiWLp+Cgw/g+3ueljkCxswGNDfJMJRsuon8chORgjt
	7tHfO/t6COR37rFS6Ir37trBF8mjPoONLt/8PA/7wZ6pF4kV2hczg/7GOO/OQOrXsLC91tffn3C
	bI6Tupz7oG2Ke7OA0OHA9zWpiCpaMxVk=
X-Gm-Gg: Acq92OGyIo/VTaOjd27RyzvNhwI0t200rZMTxp784tJS/RvayttB4+xV+M13AVCzZl6
	2Bp2xyy+9XkOmMfGD77SFfi8z6L8KZvx4nA2RPAK3aGVSeCbyADrVrBv2NMZ0b+rijWpTmnD68H
	inDYTdpqPuxTy6/QFKfsNJIjp+GNgJVpm65IR66A3KrBajvZQasaETR4q3oiGVVbF4qv7BnOKg5
	igs3IMqGzxvM8Bppx1/nwmzgEw9pj2J5jR7cMWFxbOBdyrFR8rC3m7aNY8dB704+pBwPpmm864e
	To49ZkbrHpKRXWNH
X-Received: by 2002:a17:907:2d29:b0:bd8:f776:6980 with SMTP id
 a640c23a62f3a-bdd25138390mr1297409366b.10.1779866128212; Wed, 27 May 2026
 00:15:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1779796354.git.zhoubinbin@loongson.cn> <6fd63cc57c112218ae0873b73d8c3a4b24304b80.1779796354.git.zhoubinbin@loongson.cn>
 <e45ea3e7-515e-45db-b969-cccdd3f432b5@sirena.org.uk>
In-Reply-To: <e45ea3e7-515e-45db-b969-cccdd3f432b5@sirena.org.uk>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Wed, 27 May 2026 15:15:14 +0800
X-Gm-Features: AVHnY4JeCZyvZbusebCy_cAtVLuLbZpxOZ7qVDFa0k8SAH8AQmm88OJAlLvHVks
Message-ID: <CAMpQs4Kv_Yk5zpn-L+EbkDJwaJNJ0Mwhffo0VvcLU_tv2v9poQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] ASoC: loongson: Combined regmap definitions
To: Mark Brown <broonie@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark:

On Wed, May 27, 2026 at 1:59=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, May 26, 2026 at 07:56:00PM +0800, Binbin Zhou wrote:
>
> > While moving, adjust the following:
> > - Mark only RX_DATA and TX_DATA as volatile registers. The PCI version
> >   incorrectly marked CFG/CTRL/CFG1 as volatile, which prevented proper
> >   regcache synchronization.
>
> The driver also polls LS_I2S_CTRL for MCLK_READY and CLK_READY, either
> we need to bypass the cache when doing that or that register needs to be
> volatile too.

Yes, the LS_I2S_CTRL should be volatile, otherwise, a timeout error may occ=
ur.

--=20
Thanks.
Binbin
