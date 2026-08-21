Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10C9481FC2;
	Fri, 21 Aug 2026 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787322312; cv=none; b=iWGKnTTkK4Nn4J3aWh8dQ3GNICbytADkUsPHfxw9FwZaWDzT9EnOnE7tIIE+i5Rlp2HxfU/hOKaA5u9TSDPMY2sgeIhByLiTnFiLsSl8aGQRoCMAjqI0bpCLMU2K3iYDOKsIQ43HuoslxWMBHudzjoExrUvOmfFLBVtAC+IgZgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787322312; c=relaxed/simple;
	bh=6uSev0m83myHTaG5OrRCx9gSaQoQm5nAPPI4yI0SF/o=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=uhEXUwIyvaAOjXPRM5G+t3yqIO5tJdnMbnO85+d2hydXODa1dXvxUsup09j8q0SldpXQ5HERdT7Bo5ETt+XvIaXwPrIngLK4DG4tl4m5DjTiYDDB3ESPckqA1HskZALKTXHWUzfGu17EwL/L01aupOA5J8MJkECapso7Jh/4bEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=JVJVQlzw; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="JVJVQlzw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787322298; x=1787927098; i=markus.elfring@web.de;
	bh=XOjdojlvCW9owa1kF9UtKP6L65EgaFj7+y15K9m0lq4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=JVJVQlzwrFaFrqYWEJu2lPVLFAoFhmy4wJm0ee4Oc1jtAjs1FcF2l9GdhGqKVXyU
	 gOKSnZ666X+B88As3jCs293kzhiEy1/CmcEvWpouA/eNUIOx9U0xoLxnfR/8qR2OF
	 VkoVAjY99lGhKgiuVzZOI9v9m325elnp7bXZKwUU+ftbladZ8vf82wcfQLVmzmdkw
	 E0lMVE+mLUf4yBgTlii+u1idqsnjTvZjTZSNdfko9LOv07zCCdNqjUYeFLeq2mGuA
	 XWqSI5uO4+kX9fD2A6n7E1JYwMRo1sRZRfzNtZyqrK0f/1tGmAWvydMjDqswwEpVD
	 oWcg1uVs9sfClzgQHg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MdwNg-1wQ0Ip486I-00f5CN; Fri, 21
 Aug 2026 16:24:58 +0200
Message-ID: <b8eafd53-f9ef-4baf-94c0-4e1ebac12c1f@web.de>
Date: Fri, 21 Aug 2026 16:24:55 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Subject: Re: [RFC PATCH] ALSA: pci: add PreSonus Quantum PCI driver
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260820083646.11383-2-nicholas.johnson-opensource@outlook.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vJ5mWjm/F7U267yjrtSgP3GJiEYk6AfEsoEUsvxAhRuHSDC4pbc
 WOrMLRLD5k9h/b2bWWVHWg6NSdih+7fop9SgSNOk2h5TPfAophy2yWGFux5Oye7Li0fh/oH
 TLYD57F3L4iVNmL0Ls2mYb6X6f4grJHL5ws8wmmSwKvJx8+Yb+7X5aSutxIkTGNKr+fwCJ/
 3kKAZjdI/DqeyC2Wd9sSQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:clFTVqcm+cE=;pJryYH+LNOV6bBsOR9ZnGBPQl/C
 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
 xn6fKGd18mNnAG4mch5HnUok/W1dk=

=E2=80=A6
> +++ b/sound/pci/quantum/quantum_dma.c
> @@ -0,0 +1,853 @@
=E2=80=A6
> +static int quantum_build_page_table(struct quantum_chip *chip,
> +				    struct quantum_page_table *pt,
> +				    const struct quantum_stream *stream,
> +				    struct snd_pcm_substream *substream,
> +				    size_t audio_size,
> +				    u32 addr_per_segment)
> +{
=E2=80=A6
+	num_segments =3D (num_pages + addr_per_segment - 1) / addr_per_segment;
+
+	pt->num_entries =3D num_pages;
+	pt->num_segments =3D num_segments;
+	pt->addr_per_segment =3D addr_per_segment;
+	pt->size =3D num_segments * pt_stride;
+	pt->pages =3D kcalloc(num_segments, sizeof(*pt->pages), GFP_KERNEL);
+	if (!pt->pages)
+		return -ENOMEM;
=E2=80=A6

Can it be nicer to perform any additional variable assignments only after
a successful memory allocation?

Regards,
Markus
