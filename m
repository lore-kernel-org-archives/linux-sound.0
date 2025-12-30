Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6120D296BB5;
	Tue, 30 Dec 2025 17:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117215; cv=none; b=cIXMf2IZ3RB9/fMN/L549CXVzG/nh0Z5TKbJNyRLJ8/wNyAKUs7iN6mSqmybvF9Kbjfcc4etSk4ZtlOGFlgXYgZHkrpZ+FY6QIRegJtAnPX9SSrGBGAuG/WAGh1vv04A8eCQSDiDZCpJXKfTObrpI29B8fZHZB2x6vRTYSalKMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117215; c=relaxed/simple;
	bh=+N/IjSIDB5ejHj2ePTrKIdz05Jvs6mJBEoU2jFHEjFg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6UIQ4BMlhUwaPygt2uOWn96tD2j9QxOIC6hIuOcatOopqxfxWR2QN8e3Bz63ElDnHuf2arh2tFwMyW8vKdzW888AjK2uaxPRFR0KyCP9d2BNgXYqwDWlmp4taB4yWbTR57Eukm7aWV1e65zt7c9b5ISW2yct+wuwj0hO6tmaqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OrVh/PY7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OrVh/PY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0471C4CEFB;
	Tue, 30 Dec 2025 17:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767117214;
	bh=+N/IjSIDB5ejHj2ePTrKIdz05Jvs6mJBEoU2jFHEjFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OrVh/PY7ejRXIMFdmu2fzHvatsSUKUI6jkfdZmwmXvRjXZMQlAG24v/vT+mwuSTZj
	 JvmMJJYhnl992wkNpqBzMjPezPbMsO9FISnGe0hAlbI9hI0C4A7oviodt7GO6c8Cl8
	 +F5JSqAv13sE4R+P3XXvCLFhqTYsCksIBycUsoRxVBRVckwgurscva4Or644cEqPMn
	 aYTaOc8htK7Udk0AfJm2k9yhVQZWYW6X0tZbjEOWIatXuw7VBxtYZknApSVSQh9azG
	 /lka5watD/jPIJkh8/om06MS25djB+LdyJFmr5SrUaDm0blE2yc7TJCYTkzv7jiMIu
	 2Z7Z4pxNN9jzA==
Date: Tue, 30 Dec 2025 11:53:33 -0600
From: Rob Herring <robh@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>
Cc: cezary.rojewski@intel.com, broonie@kernel.org, lgirdwood@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org, flove@realtek.com,
	shumingf@realtek.com, jack.yu@realtek.com, derek.fang@realtek.com
Subject: Re: [PATCH v11 3/4] ASoC: dt-bindings: realtek,rt5575: add support
 for ALC5575
Message-ID: <20251230175333.GA854335-robh@kernel.org>
References: <20251226083914.1052653-1-oder_chiou@realtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251226083914.1052653-1-oder_chiou@realtek.com>

On Fri, Dec 26, 2025 at 04:39:14PM +0800, Oder Chiou wrote:
> Audio codec with I2S, I2C and SPI.
> 
> Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/sound/realtek,rt5575.yaml        | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml

Where's the rest of the series? You are missing an In-Reply-To header 
and that breaks the tools (b4).

Rob
