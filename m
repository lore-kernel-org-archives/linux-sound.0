Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BD2DB79B
	for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 18:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769540271; cv=none; b=sgVl6lud9JF8C5jR2XyStAcOhVNtZYZd7EOXe8WI41mJyXBXu8UZUGJtJlEs9YPD9Otb9QkkGjF471n/KmuuPRUm8lzgWUVFXxzVxRKBJBOZorlqqCX+C2LLwdxYUP/NZ/FR3OZ9yQhy3WsE2hm57NpDQMtxvTDTULrgEqi+61Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769540271; c=relaxed/simple;
	bh=uYbromIJd1qoItwR5l+155XDps2hGe/0NlPufen/DR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rkI40BWjwxyEoFO70BvJGqlZjajQe2q6eVkjCh0O5A5Fz58laqZckzxg/NqzcdCtp1/gy0aUUaopwKF0d8sv0UvP/KSuUiD2lGw00P9M6Se6X3us2TVnCE0nolL9U7AONTYCVn+Ufoez0itEx6/xbCQSeVZHhpTQma1zEa8hnjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zyp7u0sO; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zyp7u0sO"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-42fbc305882so3692967f8f.0
        for <linux-sound@vger.kernel.org>; Tue, 27 Jan 2026 10:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769540268; x=1770145068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdwQ2scCPfsVRQpzQa7WUXDRNsFh0xJvA20rZizqUQI=;
        b=Zyp7u0sOmb5m8caQ7j9StZBcAWA2xXWYmc9YD21UApqx4a5ERc8yU2mzlQ/PXq+O0C
         VTX30D3NF7q+jvwSGGhM0mtOUm3GmfVJPX67NaXiQZ+6hAFowkw6SB96AUtGctcC6B3Z
         tpw9ftLjRzLtJtLR61wKG1rvKwdiJn7Y9VttqgfNjkhdma5rQqN8/C9qQHpifE5HJsaO
         1Mqo3Ih2JCxtRUv8SHnZjKFAPxQpz8QMNBrG/D5nTrWEtdOhE5VyF/TH60y4+Wdi9aiB
         FXXxZ5a8zDIYmyU17JqnfI4IvLDtG3CIYcKCzJN6ayYPLrZBe3fTf+v7av3PmnxuC3sX
         HuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769540268; x=1770145068;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TdwQ2scCPfsVRQpzQa7WUXDRNsFh0xJvA20rZizqUQI=;
        b=rWQKOjCAdd58doqL++OVRnEsAm/dhky0G2BZ85MZL35n/SwXPmz/0ioIMjJ4IlPcoA
         QNsDi57xDVgKv2HXeDGKCzF1SBd8QuCExEZ6R8X/xLzmsM2CPKoJKhlmMErBY0BEID3x
         opvYSowdvmA58kb24MU1UR87zEHsYHbIR+h4KtGArH8FNQDWesLKwbSRz1oZe/pckaWs
         cbrtsl5dKUg9FDxnTxcSAOIcdhGan58RwgXHAZbiFAbXhLPJL1HX2qxEW6lSEpe7NXyL
         I8hhkbtnbww8DGSsdV/ps3rYJxq2fu/r6awa8CQwc4box4si5ybwbu2lGvnF1XCv8SbF
         R0wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYLYDdbstsRRJqcO1pcsMsfV+UZs7jDDBBNvzQNPkKKd+10fawIGa3/hBx0aXOsrtUEU67wlRNzlIYZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcaxe55apcikFKyYmh2kC0a6LRt4i2zZZsKZelHn52buHEfOgP
	8wUlS0OShxGKIWr6VraUvz6/XW4Mk02tVijZanRP4pM/Qfi1RSpdAx6y
X-Gm-Gg: AZuq6aKTJhPgpfi3v0j3dZmZhBvU/HW1Sh8FfkICWKxV2H82HJE2UHs7lPGeAsMHKfd
	/JuNs1aliHvDkpSIypHVCYZ4OA0CMPi4UJGFbrY0j4lUuiieHoGXg5msgdL1ryzn35BG+0eNlXE
	PA8k4oY9I3sZ+eGHR5Qpii3GpZOMggX+tgVGuBkpsU412A21X8Wodw1yi7Q0TFFIZiNJkIOkdYl
	yV9NNPP/MfisOBeTmgNi1oUXwjCiWD1RLU8jUwWKcNPymg+pbHz1EiE7M9QnXc7nA1w7VqUegbz
	lYX8vJvFDTIbe43zkfQKJpstMErCxy33j85z9KICH4OHwUMFp+/dHWfrGtY5Zv/wkTJcsS//4sH
	1t/CnmX9PuTBHTW6M0DQ1bPO6AsaJeTS240Xg5YGHKK1P+icCM7iuo8U6YSYO9It6PCUjjbUb4e
	/X9q2c3iW9vAWyYajwy334tyPrCbnHjWeRasmCO+yXcfjtfGb0+kne0N8=
X-Received: by 2002:a05:6000:2885:b0:432:86e1:bd34 with SMTP id ffacd0b85a97d-435dd1c0c54mr4243073f8f.39.1769540268233;
        Tue, 27 Jan 2026 10:57:48 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1353ac2sm785036f8f.38.2026.01.27.10.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 10:57:47 -0800 (PST)
Date: Tue, 27 Jan 2026 22:57:43 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] ASoC: sophgo: cv1800b: document DAC overwrite
 handling
Message-ID: <aXkKfZDyG1uxDsD0@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, linux-sound@vger.kernel.org, sophgo@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260127-incremental-for-i2s-dvier-v1-0-431b809c632d@gmail.com>
 <20260127-incremental-for-i2s-dvier-v1-1-431b809c632d@gmail.com>
 <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f1d8478-c2b6-4966-b339-47c4d55fe7c8@sirena.org.uk>

On Tue, Jan 27, 2026 at 06:49:14PM +0400, Mark Brown wrote:
> On Tue, Jan 27, 2026 at 10:48:07PM +0400, Anton D. Stavinskii wrote:
> > Add comments to cv1800b_dac_mute() and its caller to explain how the
> > overwrite mechanism works and why we force it off before playback.
> > ---
> >  sound/soc/sophgo/cv1800b-sound-dac.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> You've not provided a Signed-off-by for this so I can't do anything with
> it, please see Documentation/process/submitting-patches.rst for details
> on what this is and why it's important.

Sorry. I was relying on b4 prep --check. Looks like it was wrong. Should
I resend as v1? 
