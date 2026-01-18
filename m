Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2449C27B35F;
	Sun, 18 Jan 2026 10:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768731378; cv=none; b=KEr5zk5TtIe+mCC1O8IcTvVYkhV6XwJb/5MR18o9cCbDANXivOTH/3Ikmm5ew9dS44tw01tle2Y/81nDhEWVreapNLAH5sEoEb3Za97GOU1kVrFoDA/x+NBYZUjoNgH2f7zbdyqiLv2a1Bu62+DkBj+wqVuH2xkMpWp3rd41/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768731378; c=relaxed/simple;
	bh=s19NetTmsIr6AFtvr0RsCliQwj7ccRfYFNcoxDaPdj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixPfT5bTtijdNrbiZi9DFY2LwGtRhZX8OfK6M5zf37og6TrJhqAY3blmYJ2R9Bg3jT2iyiq/+pFq9SXBEugYgcQ69CWyAJ/N3BuL4PnwXV6Lss3Isn8lgHKHwRnJx391Sq5962vwQi72sFiSLjHMA/zxBnuAKFhCbTa0JsIWeFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WlwyDo9G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WlwyDo9G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 127D4C116D0;
	Sun, 18 Jan 2026 10:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768731377;
	bh=s19NetTmsIr6AFtvr0RsCliQwj7ccRfYFNcoxDaPdj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WlwyDo9GdmbJwXokTADnJ8bNzM+xQ5A1/KZ+7hXlHPJVr8ZiHJDOyGcx4/qCJZVrw
	 EWnLYpNPK1o2GZobQwE8bpD+HrbhSU+u4tY72X0QXhwru9tWdWvW1dGTeY8Dwh9Ges
	 OI/IboUK5W1YRUbF1vMDHL23gEkOho/ROAlm7ziwPEgwdPDHCuE7B6TBXG3DQmS7T7
	 xmf3c82zBHWo6NQg+1HlQY8t8gVPAqkltHjcjVzO6YmEzSk0UpO/C17XmmD/qAT8AC
	 C6K8oD76+aHQ2lacrAogNFlbFcvQLDN/q3GG86SeMIZusR4xU9o5FB15NFszHt4ta9
	 MKKQyrAJA+OqA==
Date: Sun, 18 Jan 2026 11:16:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 5/7] dt-bindings: sound: sophgo: add CV1800B internal
 DAC codec
Message-ID: <20260118-magnificent-horse-of-warranty-e5fdac@quoll>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
 <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-5-d10055f68368@gmail.com>

On Sun, Jan 18, 2026 at 12:18:57AM +0400, Anton D. Stavinskii wrote:
> Document the internal DAC audio codec integrated in the Sophgo
> CV1800B SoC.

Squash the binding into previous binding.

> The codec doesn't have any special configuration at the moment.

At the moment? Hardware is done. It does not evolve.

Write complete bindings, see writing-bindings document.

Best regards,
Krzysztof

