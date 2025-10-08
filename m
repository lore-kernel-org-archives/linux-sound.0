Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A76E2BD034
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759939816; cv=none; b=tBPB8ty6y65bMfGQLFpbu34C2YWYn91rFt6zmjkQ0DfxB5+za4Bw31IPoBumO9MPrfDHXzCsj8gehqLr/TZYH01ypyGzWSa1s3tMqXQ9cu4Dhxp56RYSZS1W7LRLOUyjoySZY5UdKDgfv3hx4SoItpSDQf8m7G8gyOk/+jRUA9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759939816; c=relaxed/simple;
	bh=goTEcupryoN6QUiZEUzRTSMl7QfriR7gWYTzou3o0to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6rBVxsCY/BItGeSgksR88hvFhh+Q+cHMaUA/RIoij4u9LUt8TeW6OS7MEaOYK0VjyKP/SeIdymWaH1SdYhgPmyhhLkthNNl+dlQITKc58EykHKC+NnBX2gDRFYSIBoU+l76bWuJO+51N70cxCWtc0eP6zxwfsCptV78akX04M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/ksyuQq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/ksyuQq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D4DC116C6
	for <linux-sound@vger.kernel.org>; Wed,  8 Oct 2025 16:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759939816;
	bh=goTEcupryoN6QUiZEUzRTSMl7QfriR7gWYTzou3o0to=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=U/ksyuQqsMghFEXykj89s6LsVRYbXQ1yFnDKzvlSxZXAvRJmH55bw7F5rU/3q1pAF
	 rp8thqpZq/Fk7TRbLqrTBF4cgGZKzL2D8D8dsebI9zv7pqFbiiHj+XSHbYiqRU7gX2
	 6h7qfwoWvwn+Jz94UXSYpmoXo7P46qcMW8gQr+YvXRAnUltfT53QyxrJwA4v+gWd1U
	 jOadHYC1/rmrl/Ex3XF24XgEGMtwEExe/K2Adf3G6+bkSWzGqWo1l8Jdm+c3MtskmG
	 nbnJeAsn5XhkbZ+szgD/GGbiwfSdxWryc/RU1KLRS3d/1VAqW5s5dz3yv4un088teK
	 vhPWBJIe4mOTA==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b3b27b50090so1412176766b.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Oct 2025 09:10:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXwWJ0XeyQ2dZvzAhkCSGWlz2sp+AyvgXb7x4jqhW5f3Bl+jbCk7bwA4Qr2a25IkdJx4jyK+0LgHF7rwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwxHcZVlBrVoCTEWIlAemqHUZCieaWCcQtLAR3HJsoJBSIVDxHX
	KU1s66G57YPS7/w1SfV0vdZvE0BmEo/Xa5GonuJz37I5MFNuElBUxZeDeKFAjTkxdGGPjgjnJZH
	UJnhqj95mMe9QjqIH+ZwFUqjyeAEy+A==
X-Google-Smtp-Source: AGHT+IEqrHQ5YX7OBsmt1eZUdq676qfFaJqx3N7C99kCf/DQhHV/vaSQXuouL5nGOkS7AxF19yhlgrfiOvXj+1KJy5E=
X-Received: by 2002:a17:907:c06:b0:b40:2873:a61a with SMTP id
 a640c23a62f3a-b50aa48c4e5mr348335766b.6.1759939814548; Wed, 08 Oct 2025
 09:10:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008045500.44477-1-baojun.xu@ti.com> <20251008045500.44477-2-baojun.xu@ti.com>
In-Reply-To: <20251008045500.44477-2-baojun.xu@ti.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 8 Oct 2025 11:10:02 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJirBpnnXQ5utMbqrN1u-13e4todHRnnj1ZL7DnCjBNGw@mail.gmail.com>
X-Gm-Features: AS18NWAckQs6ec54a-at1M_RdVU4timGukRtp2t8p-x0Pjpk8XrEQOH586Br-WA
Message-ID: <CAL_JsqJirBpnnXQ5utMbqrN1u-13e4todHRnnj1ZL7DnCjBNGw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] ASoC: dt-bindings: ti,tas2781: Add TAS58XX
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com, 
	13916275206@139.com, shenghao-ding@ti.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, k-yi@ti.com, henry.lo@ti.com, 
	robinchen@ti.com, jesse-ji@ti.com, will-wang@ti.com, jim.shil@goertek.com, 
	toastcheng@google.com, chinkaiting@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 11:55=E2=80=AFPM Baojun Xu <baojun.xu@ti.com> wrote:
>
> TAS5802, TAS5815, and TAS5828 are in same family with TAS5825, TAS5827.
>
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
>
> ---
> v5:
>  - Change the patch title and the description

I gave you the exact subject to use... I would list out the parts
rather than 'TAS58XX'. Your goal with the subject is it should be
unique enough that the exact same subject never appears again in the
commit history. With the wildcards, it may.

Rob
