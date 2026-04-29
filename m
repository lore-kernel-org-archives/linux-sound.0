Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41B52C0260
	for <linux-sound@vger.kernel.org>; Wed, 29 Apr 2026 03:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777432071; cv=none; b=rdaBscHqRxtX0ObAqMR8NrEXIMqFnuWK8fp+MrhrY44hEx12ZeR9h2kg94sdK4e6+f2fei6x8zouIrsl1NgwyXJs3y65u38OQthLVnUE/yRMj1R52gKbZJN7iKE8QFOzc7ZLwTXwUmsn4H2Im23pZxPI1eRGdPI7lbfJf21z6mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777432071; c=relaxed/simple;
	bh=eTuqcpRT28M1Kh8simf9Vs58Tet1tvIeFtM3QLaqPqk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WetpTZSNy7Dn/S5fOHkbMJNy0hlEa9ftqTkDFrKW/aOYyZF9xNMvg/GhsF8pziWewEBwNLWvHzRZuS/uSmLGuw4pDSP/nXFK0VQmPiZZC5pLwtX4iH2F/w7SY8lr6AJMstj+DRGYpiEclI+bP6oAexMsrCHAviEqFomMvI5TrGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=laptop.org; spf=pass smtp.mailfrom=laptop.org; dkim=pass (1024-bit key) header.d=laptop.org header.i=@laptop.org header.b=qqyii7yK; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=laptop.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laptop.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=laptop.org header.i=@laptop.org header.b="qqyii7yK"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f943870baso5145589b3a.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 20:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=laptop.org; s=google; t=1777432069; x=1778036869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TPtxRFuWaKXZFarT4M6cqYcLbh8ZqBRpSWemDoC/VHQ=;
        b=qqyii7yK7Rxm6GUatIwXsrEzCwyVtjSQHJijAJ92s3tAFKPw+AIw3wZEHtj7PWcBpk
         OLhKmD3tfAKcyuPay5/dQTP5hlNc/iFm2+6/YRTa/uemVhbQMomf5sFSVLkjL9n/kyv4
         NngU5ds10cZl7W5DzuJ5zIe6zXj36eHWBf23g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777432069; x=1778036869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TPtxRFuWaKXZFarT4M6cqYcLbh8ZqBRpSWemDoC/VHQ=;
        b=LNrB14lX5+X/7ZQHENqeZr/kTxmSZ9jMaACCos4RoPT/cN+HjpF38G1+qwPS2ex62W
         DRB/zZOGNFvOmFyOP0e31FWb/DQprjrq/WJmxvNYOA5TjfYv/FMsUFM7KR3Jss2YjaYn
         TpD2NuhT4zRDz9OY7qflDJgtyNV9Ehc990F+z3Tk1MfeesAMw81udJAgC2VPqvH+tWWZ
         10L1me8XrIjTJQpHjQil1Gl/YPJJmybvIwSI6ejlgOjnveCV2tMlizoRJSjvdSjOtQHP
         UU6duetD4Pnllj+YQ2USwZyQ8RYu7cFEO6rRFfHq00Ir3UMyfVjtbLYwPqcuPgG2yQ4L
         Ghwg==
X-Forwarded-Encrypted: i=1; AFNElJ/dLYnJO2+o8b49o/w/FI0FuAAfA3AVPmO3FfjhxNByKh0RCdFJojRhlWqG+kMXrQ4fPy0LpJGxUU49Dw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywobnte2i3BfwXUuClMZ0FFOdUqgcbVcMjtzAuzNd/KMEbHxvXu
	VguUa88e/cTQ74J29T6Lrp2EFwkdiofPkoQoInWlWT4oplnaF4MnrddXTcmA8V89bg==
X-Gm-Gg: AeBDiev9J447wBtl0cqfEz2X7d61GWiKuqGUM0JsVBGvX1RzrOx3V+7Ze0ILO5baZ7s
	PonCGRKYarjTePk98NgqukDcqWgCEHI/sM+Av0ZSp2r3+xQEVv/5e7RvdVjuPfFnw6D+j+DuNOP
	xvKNXSQcaNKCKB6zGbDeWexHvgH8xfQLVcdTeLH4PRenMOtCbcEVmrYl5tMB1BEKdHvZY+HVFD1
	CKLaB1sYssGLZTMFC8x/+zewW4CDYKXXhugvWbLCBOjvJd9rWmtce2jhYH4E+SXTUkoXPbwVCv2
	lBAQTgsOsc7jWKmgK1SiEfVWgxlDsF5YVUFP0GlblAyQHWYYzIJmNnabJbT5Nk7arC0KZrf6ur9
	fD7zjwo0If/cqG35lNQIKZ7IRFEvHBV2eI0bD9sjQukVeyr4b4/oZxXTz5EAx4ia89x12vdOsvO
	VN/U5FYw2kjIcBP/KpIg==
X-Received: by 2002:a05:6a20:3d19:b0:3a2:ecb8:56d7 with SMTP id adf61e73a8af0-3a39c2eac99mr6460712637.45.1777432068915;
        Tue, 28 Apr 2026 20:07:48 -0700 (PDT)
Received: from esk ([206.83.114.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed59fd3fsm455067b3a.8.2026.04.28.20.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 20:07:48 -0700 (PDT)
Received: from james by esk with local (Exim 4.97)
	(envelope-from <quozl@laptop.org>)
	id 1wHvH6-0000000BIo8-2iCH;
	Wed, 29 Apr 2026 13:07:44 +1000
Date: Wed, 29 Apr 2026 13:07:44 +1000
From: James Cameron <quozl@laptop.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	linux-geode@lists.infradead.org,
	Andres Salomon <dilinger@queued.net>,
	Lubomir Rintel <lkundrak@v3.sk>
Subject: Re: [PATCH] x86/olpc: select GPIOLIB_LEGACY
Message-ID: <afF2AEZ-iZibtbDT@laptop.org>
References: <20260427144338.3436940-1-arnd@kernel.org>
 <CAD++jLm951WUzBVWa4QakOBuLQy+HQOD0SwQ7tHEuPkM=j3XGw@mail.gmail.com>
 <63e9542f-c170-4361-9b2e-7fde8fc16da4@app.fastmail.com>
 <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD++jLmQRMs=Hwh9=Kzu_HEAqJea2jPJ=R9eBFQQVTYpXCZ+gw@mail.gmail.com>

On Wed, Apr 29, 2026 at 12:34:53AM +0200, Linus Walleij wrote:
> So if there is interest full upstream support should not be
> hard to attain. But it requires some dedication, and I wonder
> if such exist.

I'm still here, keeping infrastructure running, still have hardware,
still receive telemetry showing children using our Fedora 18 build
(!), and still answering technical questions.

But we don't have funding for this kind of work.  We now buy-in
laptops.

It would be wonderful if keeping dcon happens, but I have to be
realistic; whoever does it will need to be very dedicated to acquire
second-hand hardware and work through the various other things that
stop the modern kernel from running on it.  I'll cheer you on if
that's you, and may even help out by mail, but I've other funded work,
so my time is limited.

Good luck!
