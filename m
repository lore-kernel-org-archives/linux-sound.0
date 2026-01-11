Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E846634CFD2
	for <linux-sound@vger.kernel.org>; Sun, 11 Jan 2026 18:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768156528; cv=none; b=cslpknpbY3GVvv6u29i+T9rDGtLilYZp0Q6to8FBxWFUw4PZyJQMxSpuK5zx62iP4PaHz9Ifn+q7Ey1hQnQ52iT5mcyQjf1L8NvUyw3OXrkZ3oIVU+1zPGFytGRSb0fXOyxJhjKSE9gkQZ0rrlP2UUCr/0DBaulaUONYqUMhYwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768156528; c=relaxed/simple;
	bh=26XSF8abaacHWOSeK0Gpp40CHuhyJtv5EuYNp6TvHIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUJ9SYHUcaRhWWbg2FI8Nnyj7cqqMrihWt+CBqjS1wrzGtWROSD7HXG79xSFV4antkWcuwaIvexxwvRBrqJhXdM9LmPvAJ3fLzfcIvJVeFPOoerQqr0lhCt6j+65K2tucDDPZwSX+eeL3dsUOLEcN+DanTrOu9K1ZwVq+HszuG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yf6j9JpP; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yf6j9JpP"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8888546d570so74867936d6.2
        for <linux-sound@vger.kernel.org>; Sun, 11 Jan 2026 10:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768156523; x=1768761323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LxHKoSi46iPA5F9rX5ZhPp9IruXA7MeRTiDagdmtDXE=;
        b=Yf6j9JpPDL1twWLRtD2+c8nxU7Di1g3ldewRYj9bbFosd6ZNBzonrCw1Dvlo843Wdy
         m5wbcN3cVGMW3EBgQNAfJ9YlpwmnmdgOpqSEb0uwg71+UCh1wXbi/vtpo8TjEZEBhjn6
         Uy2d85tZiBd5ABo1hH+AW/MnH6FU23FVqIQ5/WJq0GzgmzFsrBG2jVrwsi3LbgJhYALN
         Ewrr5a7EFbH9nS/s7haM9rMM3PKjMtfKo3RtgqKQywuDA3VdDLu3jg7V67Dc1cpwoWZZ
         ewKoqw2+scAE+hG9ZGAsEo5yL8jBvzbD9MRiEGoAqCfi7i0PmtGcACxeQyObJYX4o//K
         RYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768156523; x=1768761323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LxHKoSi46iPA5F9rX5ZhPp9IruXA7MeRTiDagdmtDXE=;
        b=EJWWKdNEpOvly1Q9pBktdu7JCACwVNXQImkIUY99dzv0Z74ERC+9NaL48MdH5VGOVm
         Dmr63pq6qcs4hKcgxy9X3OplQLa8Sbghd5bhjjk+/uD0ykO1fzvKJRs5+jArVCPEbPml
         GYN9x75nu5YB6+d423UosCoS5MNHdpvqZXES1fnMWy5STDlZG446wnxu0IkukSvRlnOD
         1DT7+apvdvgLn+ie5wEfxqmqpqJrQXEgacLaIXoA58iWRc9rh8ZxSEr+YBWS6Lzvh7Xs
         6Q9CfqmJXiXoDdC8j3CLXDuqn7tJdiq8niq00wFFml5wSztY8fEnK+B2Jbk39qIQQXJQ
         xUyA==
X-Forwarded-Encrypted: i=1; AJvYcCWyynV1cWt/g4S9odkuz77yCcu9kY9IH7SqWIm3jvQdFyXwIRq3gMpTCfZxDlguAC4JCl9EL58rXwxQLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMp50Y8qPVQDDz8I1KQ5+BP+dBlD9VYaj0VxtVojsw4uMo3LRC
	iZjksN6OPf1fh+7iScI1cjQIj2fQWYEzs+H1cnvDKETnheEqnO8Yj+ao
X-Gm-Gg: AY/fxX7v7zqhT5wijn6bwaMJfwnoRQDYlnZrmnADiu/gEzCqxLGADYXvyAUYQomPu9w
	t9g6wBfFS5piKYms6CtGNI6v5I87lIPKCZYbj1r0DDXbwpFY0LxU/VL/Ec62nhFvDY6Z+l8c+8Q
	MoyOveCp8vN/VnCCZN69rDndFKmgHBL5+yTX8YyV292Ud0e/192S9G1OWhZZGq8u1k8fZ/CUwWM
	+ps7JsXnErg+JBgSEYs+R8RrkpUeP1X+AxeiIO4u3UGgzAcHvuaRtUmG5otIuvt0713qqB4ho3Z
	KsS/R6BeyczfNKAdGSd9/IBN1g0Wr1IGO+LcJI3zY054Xs9/NwTdOmen3IW/+RhvhOXHm/a5mY8
	2fztz45+ce+iCqfaAPRH712oZJA9g7bnp8oEh4ttc9/u5ROixpFBmAuwZq61XdsbdgUXMVPhrUf
	hWNti6RF+DD2ADfgHa+N2toIqcWyB07AQnvG9xtbB/Gt4HTWfiJ9oVybwVxA==
X-Google-Smtp-Source: AGHT+IFr0AfQqdzuLfF2we3Zx/EJP2hZFx2oG+SaK1KaO8OqQ9sYp0F8cg/P9dtkorxfQtRFUlfUMw==
X-Received: by 2002:a17:90b:28cc:b0:33b:8ac4:1ac4 with SMTP id 98e67ed59e1d1-34f68d3b273mr14688746a91.35.1768150214300;
        Sun, 11 Jan 2026 08:50:14 -0800 (PST)
Received: from google.com (61-230-24-179.dynamic-ip.hinet.net. [61.230.24.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f7b19ebsm15175971a91.3.2026.01.11.08.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 08:50:13 -0800 (PST)
Date: Mon, 12 Jan 2026 00:50:08 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com,
	sre@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org,
	lgirdwood@gmail.com, broonie@kernel.org, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/6] dt-bindings: input:
 google,goldfish-events-keypad: Convert to DT schema
Message-ID: <aWPUwCbFoIItG7n3@google.com>
References: <20260108080836.3777829-1-visitorckw@gmail.com>
 <20260108080836.3777829-4-visitorckw@gmail.com>
 <20260109-remarkable-crane-of-exercise-6bc17f@quoll>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109-remarkable-crane-of-exercise-6bc17f@quoll>

Hi Krzysztof,

On Fri, Jan 09, 2026 at 09:23:33AM +0100, Krzysztof Kozlowski wrote:
> On Thu, Jan 08, 2026 at 08:08:33AM +0000, Kuan-Wei Chiu wrote:
> > +
> > +examples:
> > +  - |
> > +    keypad@9040000 {
> > +        compatible = "google,goldfish-events-keypad";
> > +        reg = <0x9040000 0x1000>;
> > +        interrupts = <0x5>;
> 
> Same comment as before. It applies everywhere, btw.

Oops, I actually had a local fixup for this but forgot to apply it
before sending. Sorry about that.

On a side note, none of your replies regarding v2 appeared in my inbox
or spam folder. I had to retrieve this message content from the lore
web interface to reply. However, your replies to v1 arrived without any
issues.

The only difference I noticed is the sender address:
v1 came from <krzk@kernel.org>,
while v2 came from <krzysztof.kozlowski@oss.qualcomm.com>.
I suspect gmail might be silently dropping the latter due to some check?

I'm not familiar with the email protocols, but perhaps it really is time
for me to start looking for a gmail alternative... even though I see many
entries in MAINTAINERS still using gmail.com addresses.

Regards,
Kuan-Wei
