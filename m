Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFCE2D0C92;
	Fri,  9 Jan 2026 09:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767952590; cv=none; b=iZGF4HEfnEhjCZBbhaBlL5xEvNx9Um6cYo0bPrgMAmUdgcougLBYm7Bhe02DXK6V5qChZ7m4iOWCm8UabqPDqYTpaey2V7dN9kfqALt8SmXXFjXmtLQXZadoLQ3Gh4zQKXC/l+G7iUhB5jD11USpKZk6OMHQhXq5Y0IcL4/usug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767952590; c=relaxed/simple;
	bh=ZQxiB3YcR+StwZfqsONMJvPesOPexzjN0pZfvw2LkLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMfoOeNTLIHgjyHrIAWCokgnrVSFlqkDrx/h1BWEhyX/C87zXJXd6tgjsSdmcxqgDXS8TZXPUXZd+9eczCsrUmQ4GdpkScOiVYspHj+yr6A8bvg6kiTLP1+f82iDDnV1eNre00wsDaMT78hn1Tcei0fN0Cgf+TtihIdJi5JVx9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAbMxV5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAbMxV5R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0FAC4CEF1;
	Fri,  9 Jan 2026 09:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767952590;
	bh=ZQxiB3YcR+StwZfqsONMJvPesOPexzjN0pZfvw2LkLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAbMxV5R8JlZUCNUfEWsrR7UoYF8z1iE+y1utqlaf0ZfaRKFb7zUlchy92OPOkSfF
	 iqBeY2nblRtEWZxoc+7Ec4OJg3jiTcdvQHKdVANg2EV6kdbOPkwKsIGk2x/Ynk1SSl
	 CqzkmupT/2/poy5OxspYcGhmI9qKGHzJT5+F6Nq9shEikqXTaHZQu4gcmAwBAN2X2+
	 fafw5+DI7oIgT56lTn5nv+2ne6cSkQC4LpYblq7B7VYr7v4+Pp3wyrfBBsU9gbndJC
	 EmM6apFGDm3OpBjtEq4+HX8xejLdR7Cfyso8g8eNgNpPTBEu7Dm8LKrrVPfp/vtCnz
	 bfSmo5kbyWx/g==
Date: Fri, 9 Jan 2026 10:56:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bard Liao <bardliao@realtek.com>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
Message-ID: <20260109-impetuous-tan-bullfinch-e6ddb3@quoll>
References: <20260108214443.1127685-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260108214443.1127685-1-robh@kernel.org>

On Thu, Jan 08, 2026 at 03:44:40PM -0600, Rob Herring (Arm) wrote:
> Convert the Realtek RT5661 codec binding to DT schema format. Add
> missing clocks/clock-names for MCLK which is in use already. Also add
> the standard "#sound-dai-cells" property.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/sound/realtek,rt5651.yaml        | 100 ++++++++++++++++++
>  .../devicetree/bindings/sound/rt5651.txt      |  63 -----------
>  2 files changed, 100 insertions(+), 63 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5651.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/rt5651.txt

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

