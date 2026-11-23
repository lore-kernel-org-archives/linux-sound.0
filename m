Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795418441;
	b=W72QkBK+UFL7G752EINpTgbCkxxypY/pQpec0ORPTFXMYgVemcVRxidTqeU2R1awrRWZ
	 eiATL4BSiEW0shuZ29AZHg80PhZD0c1k80ObU95GsBCPCIKOV74ZrdXzw9PwUkjzYgMKf
	 MrTZCSOnhTmYoE+PwaEwxVhBFnT7L58KHHAvUd9NGgqnlHGN6pXHHFjzYidx5wKAcAznj
	 bi3oC2PVNFyTtR/TN2zOYAlzaPbL/JUqFk//bcFFesgX81WEiV8pxhVgMXczKRhA60A4/
	 MI3LrscpWrIimnLC91aLK4u43aMb7zqF99pDYqblqBajNxf6EKH1m40itvTwlLptK8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795418441;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5DFw/e8NbLOtDgOVzRqL/UczE4S7lgWwLX+RaMIW35c=;
	b=nbXNIXF9ODgqDgHTIUZWv8lXi6HE55uRwbUesTj0yr6vHZciIQ3lrOz53HKHWIHYK5/i
	 2rP1aStwKr1imXrCNlfArQmuwMYJiaY01T457vXAEWnl/J3IydG0ysBfTJHQnducoKJus
	 qesxQLa/2to8gyuGKc7Bcvq6szpotn8HYzxBlGkQNpIapuXsaFoIIHseYwkt2bMhTd/1O
	 ZNzcTKaajUTKgWPHKXOxAmncjKnDiaeqitMIfhbOiwY+VAEs8y89YT9Fk6mtRiRAQC77X
	 Esax4WsjyRmKy1nPX5wgI98e/pSJxaG1RJnZvVTMT04dRmMjEhywCacCTL/GK4zAHOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnDlvS7l;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 535E2606A32A;
	Mon, 23 Nov 2026 07:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GnDlvS7l
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD61D1F000C6;
	Mon, 23 Nov 2026 07:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795418440;
	bh=5DFw/e8NbLOtDgOVzRqL/UczE4S7lgWwLX+RaMIW35c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GnDlvS7lvlzKZ78arn3vcFhBxyJCTZrE+Pc4xkF8k/7Cwxy2Z1DeeWugf7SvDyYFp
	 SYVw43rG1xRBKleTZAEx4pn/0I1CshwLFf1WZRkKnxtXYujdoQZnwTtzqTxjTR8K9c
	 +ITbQcbffwX8rEOMrI5c8o3mBP8pbrzkqbrZYnwqeLVmH/GWQL4rne+lQd6JXv1vTI
	 jGx/nHYlVbTBe4c2cB1ihz6ed5GUg+PsfBW/emWGBYRjA8bERn31yXuFUWHUTQJbN0
	 9JGyv9bWRBDFwO1pYyxaM1ag1FCJ7SSAjmWnDQuCAhTXALJB+zsNx8eoYPErMlClHb
	 OSQ+LH9OvbPeA==
Date: Mon, 23 Nov 2026 08:20:36 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: tiwai@suse.de, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ALSA: hda: dt-bindings: cix: add hda dma memory-region
Message-ID: <20261123-mature-arboreal-seal-5a01fa@quoll>
References: <20261111103924.3395516-1-joakim.zhang@cixtech.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261111103924.3395516-1-joakim.zhang@cixtech.com>

On Wed, Nov 11, 2026 at 06:39:24PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Document the reserved memory region used for IPBLOQ HDA DMA buffers,
> since the memory accessed by HDA DMA has certain limitations.
> 
> The property is optional: the controller driver falls back to system
> memory when it is absent, but the limited region should be used when
> the platform provides one.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../devicetree/bindings/sound/cix,sky1-ipbloq-hda.yaml    | 8 ++++++++
>  1 file changed, 8 insertions(+)

Where is any user of this property? Why patch is alone?

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

Best regards,
Krzysztof

