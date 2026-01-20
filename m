Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D673D667D;
	Tue, 20 Jan 2026 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903946; cv=none; b=IUX1opdVp0ZTwA5gr+nku8vTMZMBMv/7amAjM8uZZrnhhKW4MuWx9Tgdlr4cNTqjpKrhh3hVzTLeLdHaOqCSNSiTNO53payFhQuP7fbAopUXn8zJpZVCeBkhS83FjM3qPU7q8TuOaUkto+C7qHoMvp3GigH+2Y7q9z/KR3vVXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903946; c=relaxed/simple;
	bh=Zl0EKiX/vDiGriw8Csf4K6DbilEEJTuZv+esRqz9RV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzpBcEmMDkyyU6nvosRh1DpH0NtcaUe+vSfadX6NedvGxa6QQ95tRMWIG9iKbi27RVBvmYyFaoOWFdcv3Pke+R5NTcCDBcIhj4gV+bTRxx+1RmUNa9rsugxeUuuWS1pKg2BytvcYA9zpbSZgRX0wrSeC1teCotxq9DSEisKJbkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJqHM+qr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJqHM+qr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6444C19423;
	Tue, 20 Jan 2026 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768903946;
	bh=Zl0EKiX/vDiGriw8Csf4K6DbilEEJTuZv+esRqz9RV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SJqHM+qrlsFxzvU5PfoSZMk0yau5k4To/SOce72gwQHGF9Bp5bqjOdXiSE/wvePXf
	 ZKVrqbgKTk8WtX9YlMv0F01flen843N1+lXC/bf2emOHP0IjJ3+bInHA+og4e8y/Gs
	 kVfDBltHb3mav2HykfFTSrTPIJkCJQgFvpwd1HKp7wW91hoxRNuAwTrb+5t9cpH7/5
	 W7SoC5N8hQ73lmn9PvY/x72YlEypXQ8mwz/kH0onseWS6xukT8EBFyr1+/tH82t73o
	 hqM2cyUaANs8nEkfLV71BAXwsaA5aIMYbpRdjEfPP1ZdVOUO+TR0OnPSbC0T4YIoII
	 n6SIvs0MsM5YQ==
Date: Tue, 20 Jan 2026 11:12:23 +0100
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
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <20260120-rapid-turaco-of-discourse-fe3fe6@quoll>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>

On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> Document the internal ADC and DAC audio codecs integrated
> in the Sophgo CV1800B SoC.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  .../bindings/sound/sophgo,cv1800b-sound-adc.yaml   | 43 ++++++++++++++++++++++
>  .../bindings/sound/sophgo,cv1800b-sound-dac.yaml   | 43 ++++++++++++++++++++++

This is not what I asked. I did not say squash patches. I asked to
squash into the binding. COMBINE the bindings. We do not need multiple
documents.

Best regards,
Krzysztof

