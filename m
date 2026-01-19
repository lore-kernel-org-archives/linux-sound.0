Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBDB38B7AF
	for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840982; cv=none; b=hNEJP4ouXbwkQvDzdhAOFL2pVF4Oi8nSCsIC3Jj5vWfPm4p8epu21sNgLyTETw9X4l+gjj73tZXbgZPeD+nJrmlgWckDhHqsQoPn6/67hYoGqI/yR0Vxbf+B6lWYHxxb+zrfBDMWKvx+oPvsjOVyI1SH2G5uxwDcOGsUG13k9dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840982; c=relaxed/simple;
	bh=GIklxi/q1fiaSMZ8P33e26bVO1hSHIIYKKnrErHesIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GukJz0/5Bkv7qduJz+4VBSWujFX3PXAa8CWEoSDItkED549705bFhrpvxUUP0WG+lnrDGiAeAP+oy58/QKeH0ldmowC4XsU1h3RiHb1VFA4rlWycS4SHii0JxS8w8KV+ZcgPUP/gaisKY49lKW7tG/1xaHbgesG4oTfRDevACUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coESqw2Q; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coESqw2Q"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so4003677f8f.1
        for <linux-sound@vger.kernel.org>; Mon, 19 Jan 2026 08:43:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840979; x=1769445779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OE5BjCYXuBdt6IRWd0lb2DWlaLa+Xld6lMou1p1B50Y=;
        b=coESqw2Qxg1dmcUhS97FmzTQ+HJTVvLw0TFuW/FG/br0W4D+SstNN5DFAs4CBWB+UG
         IR7+5Tn+pqlDDAtpljlIbz1bwJ5gqSCiyUJfQWMXno/PPdg6qIaztCusPvFZhQmEaAyB
         +6TyWkC0GXjQTaPM3XhiC9qpNO2kki3cQiG9FNF77OnGsRJBb8jSuzRwp47EMo4q3cU1
         GCucDfmulbhFtz2oSXg6EyJds+YaUlZQpkX3TEuCJkUymEcUFMFDRufV2aG2mMjXYNsM
         8LhjmN9zyDTXMgEoMm2oKL4RxkkSn/CzHSmshhjnD4BXinHMLEjPkjwGvNcr+25dWPFQ
         FglA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840979; x=1769445779;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OE5BjCYXuBdt6IRWd0lb2DWlaLa+Xld6lMou1p1B50Y=;
        b=tJU73c8J3OkJoMzyoKwD2s9KAZZh5Zma7pQ/bSE4Qr6Guh1sThfbNkN7cBV4qpEegs
         1fU9yzXehdfj5HrS/qpvoO11sEa4DRi30hM1g+KI0Dioy0eoUQZmeQky65M/FzAZ8+ZV
         z9GBleyXH38+xiJLIJOHxogPz6YeH92SI2kLT1Suhku4GjQl+2kwJytc1gI7THJ0lQT9
         tgBaigvan4z2BvdyqWLqo9DeR9xYoI0c8dbfZA9vwZQlja55BkEL7yAyOZmPNom8qhBY
         15Vcnp4Bm9AtF2enz5ycDrppwTIBBF6hrl5DkVSEy750ueZZfFqceQtXYSsDSfdUpG/X
         r7bg==
X-Forwarded-Encrypted: i=1; AJvYcCV+fh0EdrAeUuF9pVeDm0wKHPF8A23z5m6Rp9dLmkFvZdm+iKT/GK5V4BdKhABHRErZMj7hZZrYnHyaZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfxod+jszmpeWcH3It/L95IivpFFXlNUOouOc7P5dpAC2YOhZw
	+ZOSHnwDHNlOtNJWMk8Egmjj8TQFc1fJV/HEddTQNMTJ2LfKFBQXJwrO
X-Gm-Gg: AZuq6aIa/PbUm73d8FTWjhVgEad9SQuBOF0tILdrpnRARGoovnPmJbGyt4+aVIZ9DzA
	G5xpIzcDAfqtUKyzJkMUsEBlv0VYh6rySHJS6nbMN4C3mb0Fx+IMe1F27y5D5Xy58DtnNbS/Awc
	3Hv78PfFpok93vDQ5lAcMKuPtHl5wKMbO/IkApmg1hDKNaMdsl/eFkQMkydPIpARdlgcdc/JlT6
	sajqNwwTAUkNaFTCPfFzpL4RZNEXwrCli7BYrzs2hfi31LH+Wl/sD7JMQ7TwzVQ+uQ2warKpkNc
	8wjNupcicFekjvUJcCt9jCZfCxGboM+XSgPQ67lAZsua7ad26n/hKvlrypTRcIDH+3lAdCIAys6
	wLNusyFyJKLNoxdDKfIiMdjKQ2yPdUMfb1ROueG1QjIj9iVAY35Ou9+MhCrC8zO+IQ1aKQiGDmA
	Lvr10CfBiTSSFHnzDFvSckZRO2cZ0IlQdfzZqRj7XEMRM=
X-Received: by 2002:a05:6000:2307:b0:431:5d2:4526 with SMTP id ffacd0b85a97d-43569998dbcmr14869350f8f.19.1768840979260;
        Mon, 19 Jan 2026 08:42:59 -0800 (PST)
Received: from anton.local (vps-58d0fbce.vps.ovh.net. [51.178.29.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e6dasm24493290f8f.32.2026.01.19.08.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:42:59 -0800 (PST)
Date: Mon, 19 Jan 2026 20:42:54 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <aW5exOoNcVY8EYON@anton.local>
Mail-Followup-To: Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
 <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>

On Mon, Jan 19, 2026 at 04:36:43PM +0400, Mark Brown wrote:
> On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> > Document the internal ADC and DAC audio codecs integrated
> > in the Sophgo CV1800B SoC.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

Oh sorry. I didn't verify good enough before submit. Will fix. Thanks
for pointing. What is definitely wrong from my side. 

