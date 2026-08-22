Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5F2C11E7;
	Sat, 22 Aug 2026 14:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787408428; cv=none; b=Zvkm9h/EUzzz46lG8ogfhzRjMOiATaQkcaOQwgT9TQmBG37qFvY13PYoeyTkfLbXDoC+zmxmr0kMsIHWfExnfmp1V04aUI/kTivfpjeVkHv1ybTfF98LgxVWKWq/CghDc/hdhrcDec1aI46Z014CuaQH3iGgpf+UTfBqrNDa2b4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787408428; c=relaxed/simple;
	bh=0W7qJe7CnpwnNIAu8zW3v9uLmZ+odhj6/oCFRYb4cmo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Mh4cnMD0zcxkHj6rZr8r1Mfq15tTwHy/xLYXLXy8/WWSTcTDQws4lpakCAD25vO8ZB+CWGOFTUyI9ramfW4dkJnddane8IwThC+PoD+/xR+yKHAF0i9OtfwsCGoSejudA3QqIOIGe9vGmVjsAMMHvwqo5KK5pYf0AIYbv6rIHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=C9fxh3hN; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="C9fxh3hN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787408413; x=1788013213; i=markus.elfring@web.de;
	bh=2NQni9yuHCk/WUTVBuNFb3IcyEWj+TCrLD/UzJba1Ng=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=C9fxh3hNryD1s2UtFQrNeueYedWMQPee2raAgMZMsKMpeVcbVX9J+tCYIBuJ1+T5
	 9SotH5TWYIFWW164fXRCWH3Y4QDAKMUUqePIDqEwBw4uFGNKtGo0hA/UQWMenfMTZ
	 1H4FrDLsybyUF75QOYs0N43LPJ/CCscGEcRdGnpFHFy8zk2qyRdApnIG6yIowcdu4
	 xRKTqTTvXpO/uxbASCqy0J/Tjt4iUlfaEhS+AaQF4ucZIg8xvUNk+WS8UHK9Xj9YQ
	 2MzlIqZPc40zc9CHTLly2Vk745Z70cZ9TCkm7r+PS/Lli6pjGMx4CXD+ZkQ7KQMR5
	 a/aEzvpxkbSuxr+Ggw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MqIB7-1wbsEQ0QU7-00i76k; Sat, 22
 Aug 2026 16:20:13 +0200
Message-ID: <d6372c76-346d-4586-980f-79a47b6ad743@web.de>
Date: Sat, 22 Aug 2026 16:20:11 +0200
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
X-Provags-ID: V03:K1:vAnHqIPuI/YiAOtXCk9pmy3rZ3dXnWVhH3jJ5Fds5r41wfZdeWH
 Tx35FT7fGcVMQlnojNptgfa7Ya3j0QdvN8W9EGeN3k/W6BVHTbAQut/BdP/b/xIOjhXRniK
 ZYK+x0dEbLutcNT5UsyA5CGTUrFKOFV1Nj9dCcdfUrOhLnQhYhTsLgx2xSPdqSevkAWL/Dy
 sg6CkTTKw1GqYwgJacfBQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L8bD/vZ1gKM=;YexLA/luAMN3nMlC4YTIxFV0yKF
 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

=E2=80=A6
> +++ b/sound/pci/quantum/quantum_dma.c
> @@ -0,0 +1,853 @@
=E2=80=A6
> +static int snd_quantum_create(struct snd_card *card, struct pci_dev *pc=
i,
> +			      const struct quantum_device_entry *model)
> +{
=E2=80=A6
> +	chip->cmd_wq =3D alloc_workqueue("quantum-cmd",
> +				       WQ_UNBOUND | WQ_MEM_RECLAIM,
> +				       1);
> +
> +	if (!chip->cmd_wq) {

I suggest to omit a blank line at this place.


> +		dev_err(&pci->dev, "failed to create command workqueue\n");
> +		err =3D -ENOMEM;
> +		goto err_wq;
> +	}
=E2=80=A6

Please return directly in this if branch.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv7.2#n532


=E2=80=A6
> +err_wq:
> +	if (chip->cmd_wq)
=E2=80=A6

Can this pointer check be omitted here?

Regards,
Markus
