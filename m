Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737802236F0;
	Sun, 12 Jul 2026 14:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783867936; cv=none; b=FfNNO30wW0C/JIeMmGlPKvxmCbwPbUSjtnifu7SJCNhs++9ouGn9MnUmhTYvDqScu2Uj/ehd8bCjXYpRNyJpKcDxbsOfX+XX88yW67gFmjCElWxjNgGV534cgKppzHnycBOnEG8P2gVCGS5Z+3QyUdZg3mQIWjQFFJYfjYg10ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783867936; c=relaxed/simple;
	bh=71TOPVIgR92fcyFwDE8dT/ekjSMe0T+ICqRFJLUazMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAWonqed9vzEv72w7swgXP5xm8Pxy3xamY1KOss/ouXYnK3C9Bk5CJz7kuHAOjzbNGt6nSGYr4O7EOxx+2Tf1j2QDOJiRUsMn92ZMcu/kp2MIAOwBbLUmjtnkZcUoYT3CWikfC58gja9yEZVi/5wA5fR6Pj/WcmLmVJS2+06Ac0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E26k9XPG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E26k9XPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47821F000E9;
	Sun, 12 Jul 2026 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783867935;
	bh=pcQJEUPjdlIOaCP6jc026Qs3EDNHxmJ2sL38FlUr8po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E26k9XPGiN6m4qwBqDWT5ejisB8f6XKMNg9V4F+jc/m/9C5oM85Rr6LdgpsMoZo4G
	 zsAq3fdbUlbDW74N019CCoEmPSzNCiWVRhRS2R6992Bgzuu5TZ/53VQk1pY3+an9b8
	 hBkyzTIMrnUCD9zKJpR4EXpI47E2tx7y7JiRhKt0E2yDNTmUJJH/LwEia5WEMZu62b
	 XCBhQ2PsjRLSoSmPW75xVuviPFqEHaYy9iQsvaWb3gKZ7klTbsZDUugrC5GMWIEPfI
	 awGpK0Dvg2vERwBzdZp2+YmzUAqZ60UP4/8iGxDUePYFeiq4AwG1xLELebrtXIWoko
	 cT8e0iVVlEvyw==
Date: Sun, 12 Jul 2026 16:52:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gianluca Boiano <morf3089@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	"Wang, Sen" <sen@ti.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add Texas Instruments TAS2557
Message-ID: <20260712-cyber-gorilla-of-acumen-19070e@quoll>
References: <20260711145722.188556-1-morf3089@gmail.com>
 <20260711145722.188556-2-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711145722.188556-2-morf3089@gmail.com>

On Sat, Jul 11, 2026 at 04:57:20PM +0200, Gianluca Boiano wrote:
> +  ti,imon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX time slot for current-sense data.
> +    default: 0
> +    minimum: 0
> +    maximum: 7
> +
> +  ti,vmon-slot-no:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: TDM TX time slot for voltage-sense data.
> +    default: 2
> +    minimum: 0
> +    maximum: 7
> +
> +  ti,channel:

ti,audio-channel

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Audio slot of the stereo stream reproduced by this device (0 =
> +      left, 1 = right). With stereo firmware this also selects which
> +      per-device tuning set is applied.
> +    enum: [0, 1]
> +    default: 0

Most speakers do not need such property, especially that what do you do
in 4-speaker configuration? I found only two references: awinic,aw87390
and awinic,aw88395.yaml.

 +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string

Wrong type - there is basically no syntax like that (except a few
left-overs which I remove now), so please kindly do not upstrem some old
code. Drop.

You need maxItems.

Best regards,
Krzysztof

