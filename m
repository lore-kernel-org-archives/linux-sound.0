Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D882E5B2A;
	Fri, 18 Sep 2026 19:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789761102; cv=none; b=VoZc8pl6BUAEV9hnWQx3TM0bMowclzwlbr7/+vf0lXtCSmyqfZXW18QBvNpQqG3VPOdVlMEztIDj5Eob77DhO3qvontg5qRorMX4jnzzuT2mOgak3wMjs/xvEC3UGFo9gedjVMuvbfZUiuRrC3Hy1qeKFpIkd/1SnMUdZk3rRCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789761102; c=relaxed/simple;
	bh=LZ4JamYwsRKftcvve1voPpQACuQy+lgwGO9U/r4XXx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UkbTMMlCRxtPurYyjRCrS7AvShyb9kRTnCt/DbyMVveuq2qOIi1V4Bjwe0f4IFqtb9DpXo7sg8fuIpRTKPI9CvRdVHzgyhcoXsxekgiEl4WSGDTzsffTN5nPclqPPb6/s3QoS6eyUAxckZdQ2Q9KBFjrLHlbi04ELJ8Uc3Z6Cjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FsDYrywM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FsDYrywM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A671F000FF;
	Fri, 18 Sep 2026 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789761101;
	bh=KfjDyVPhNdw6VvPDzl2FAh1F0gBNwo97w2xVNHf4kgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FsDYrywME7y2Ok5SW0B3R6vGjcSans0bXiJjXiWjQdh+ku+Y2PlY4/Jg5/vlwucd8
	 G4kQJiEZtVf6y2eblIzFGcZ1etov7HTU9Hzh/HvemaM+LWOBt6+mWF6OgiAn8QMzrh
	 HZQ9674xZVM1EhE7LDytKg39VJ+HKM7MriA+0aITamYfxWo7jTauCb1fco6lT0V4gz
	 PO6dq6r9XkIbsfuethLZLFpRnh/uNrfKJ/+XcpqrIaTBbpwM1NSAUv8z1oG1HIqJOE
	 NGKSG6++alIyC2WfyYUEBnDIYgRa7uqNnicit3ms4IOA542o8UjZpyze9rDByuSLqc
	 DTqEj+D8DwgjQ==
Date: Fri, 18 Sep 2026 14:51:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
	Lee Jones <lee@kernel.org>, mfd@lists.linux.dev,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/9] mfd: dt-bindings: ab8500: Describe codec DAI and
 microphone wiring
Message-ID: <178976107058.1655739.6392532217175224491.robh@kernel.org>
References: <20260911-ux500-simple-sound-v1-0-6771ac714e82@kernel.org>
 <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-ux500-simple-sound-v1-2-6771ac714e82@kernel.org>


On Fri, 11 Sep 2026 01:03:45 +0200, Linus Walleij wrote:
> The AB8500 and AB8505 codec block exposes two digital audio
> interfaces. Define the codec as a one-cell sound DAI provider so
> generic sound cards can select either interface.
> 
> The codec binding conversion also omitted the analog microphone type
> and bias-routing properties supported by the driver and documented by
> the old text binding. Restore them so boards can describe the codec
> wiring without schema warnings.
> 
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Lee: just merge this separately when reviewed for DT and you think
> it looks good.
> ---
>  .../devicetree/bindings/mfd/stericsson,ab8500.yaml | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 

NM my comment, I see you've added a user.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

