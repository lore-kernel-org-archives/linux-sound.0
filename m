Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206D5305057;
	Wed, 17 Jun 2026 10:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781693422; cv=none; b=WEzqlZFfNnsLT2H4/VTj1o3HLCS6viRzjnCQKzJvC8ba9rGjpJa7Hlqyjkp5uGptkTsUoTEVu2nMA53FXgPKVThcjZ2FK7IMyZAuqp3MJD4U6//ZwBZZMibBl6IYGXHcYvpAnMYM3Gs4OOw2kebvrmyCsu2oa6KhW8ZEAe1ddJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781693422; c=relaxed/simple;
	bh=G2SGWa5N6ucn+9UK60WuNYpe8XUcdnVB88n3VTklUnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CZk9/b5I7yLw61K8GDBeG17B8miy5N60YLVkeVTGDkr0ogOzwXI4Blf/89VAF7Ca6JhHwYSJgv/W/O6w/qL2+RK5ElMwCYZ/yiqvlw3qF6y+gWsA45e775LNPjV1YzL8xiZUoCGdk1Vo1GdDASP1exzMT4dukopQ6ygaHZ8B+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mAeWxJNt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAeWxJNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3171F000E9;
	Wed, 17 Jun 2026 10:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781693420;
	bh=gsH/cbSQ8Rdif7hB4wxv5EmRO0rjtZtS7++pqAxuNLU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mAeWxJNtW8Lh29bWoOM6LzkY233JeRBvzVj/kVUQ+z9HtQz8BUlcb/Z24xvODoKUT
	 kejZelGxWp3RbgL9/L3jYwagrGH6cpd4lvystsUhzAb/b5H2mcGfvH7UPGNo4/VVic
	 so/NbdAhim2IgKBUTwgsJ5JI3HYRQcmDzTh82s27Q0sPf4sstG8EO7Q/CBZWvakaDX
	 RYEq3yclOShbGJKrPlHfRubctM7KicRKO269JOF061NarkmoZGdo3pBqTw7U5wyWJR
	 UwDWoIASzYFMekM1ogB9ObAhgSs+t3Oipd7i6C+AcufozdG57J7GTPW4/AuxQPLPnP
	 Cr/gbPlr3riWw==
Date: Wed, 17 Jun 2026 12:50:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Pablo D. Bergamasco" <danpablo@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vaibhav Agarwal <vaibhav.sr@gmail.com>, Mark Greer <mgreer@animalcreek.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: sound: add toshiba,apb-dummy-codec binding
Message-ID: <20260617-marvellous-cunning-curassow-0113ab@quoll>
References: <20260616185619.1581174-1-danpablo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260616185619.1581174-1-danpablo@gmail.com>

On Tue, Jun 16, 2026 at 03:56:19PM -0300, Pablo D. Bergamasco wrote:
> Add device tree binding documentation for the Toshiba APBridge
> dummy ALSA SoC codec used in the Greybus audio framework.
> 
> Fixes the following checkpatch warning:
>   WARNING: DT compatible string appears un-documented

Nope. We don't take bindings for staging. Isn't this documented in
staging docs already?

Best regards,
Krzysztof

