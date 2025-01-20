Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510A118801A;
	Mon, 20 Jan 2025 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737363661; cv=none; b=d9h8flB5NTNFJ6nqQS4D+VMH98eTRPpkE1c69UA5sIBD9hWorF1d/PI0vLNHq7iep3Jh86gXABeNG+2YOTrLug3aQxH9Q7dLpYHEpM7HN+Q89l0+2PIGA5qN91VIuB/D0w4Mxvsq3kb+mWyjFuuPo5+IWXV/osdvTxeuGlp+TJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737363661; c=relaxed/simple;
	bh=i3RzSbSAFOYRz+LjJB/UoK23R8utNhUgP3eFyaBi6Ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkoOqsQjKqhWWeC6Sfu7bIMwL2Ofddf5VoxrIWl31wNvR+xNmplcRWTJmyGYOOBUpPPMveLC2f3/X7ZWSMwoWIu/aP1d8cGBIkSf2wOpkAcl8DJ8WAgFrTIZiOw2eE6njp6xqVHEcFsxn8nPoLYJRPfWYspmdLZ1IZQIDI0hN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mac3UcKh; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mac3UcKh"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so6468131a91.0;
        Mon, 20 Jan 2025 01:01:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737363659; x=1737968459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3RzSbSAFOYRz+LjJB/UoK23R8utNhUgP3eFyaBi6Ck=;
        b=mac3UcKhb78p9+EwucVl6e9Tl+4yJvVSi9baOxHxQaDx8w0Usju5RgnmtT+Ac6wFG4
         kz+QhzmV8ipi7zona9edmhZrvybmDfS4GHWtO5KfEDrX1EHGp/3cN4XPqJlV8q8rNJV6
         ORz5P/+8EW770WQAjMOgXfQjMGbKRPzNdqyoS/NX1r/mgMqKcUR8ZkHhppWYKG1gP4A8
         QqgrUSQGVUmAvDeDT1R0mJoj2jPTZeX0jzxqXAZ/EVuwrComq6KHNPuJ0j5FnQuYWMp6
         4KxxZ0ez7KCf4PFFnchufmk2YwWPvAO/AbVoratxAbRwFFJlSMjqOlbWAkXYFdGlhFdD
         vjKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737363659; x=1737968459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3RzSbSAFOYRz+LjJB/UoK23R8utNhUgP3eFyaBi6Ck=;
        b=GZ0EybWttGlirPOMYqWVx/Jv+O+1lBEaGdA0hk8Pz+y7oNP+wGTxi9MJZzlePqRy1Q
         OGKAM4M7UrLJ0n9p/A9Ue3MSnMgTrA2LHbt0v2KWXOYAOHGvdIRoaoi549y2pyz7Pyw/
         jRJD+mKxY7GtFZ1ziakhD6pPbUJKS4xRowfOKHj0Tdaqlv4GUn03zYwqHk2Ey9rVKOy2
         IMdjC0AzFn8SwFGOM9pZ8xdNUXYLhv19xail1cUqwPZMdAtDM4DqNjg94Alh2XIMYQ+9
         3B1gGL3G3CamTNnj7Pmnl4xHZqpYOKYkXFO1o/41gxIy4pBKHfUIx60qHzCVNlHwAK2S
         s1kA==
X-Forwarded-Encrypted: i=1; AJvYcCV85hkbA1RLgEjVFtmh+7XRor9nzM8h/TgoQFCwmB/W0OlydWqWVaOXS/r/FXEXxi0uTbYfcMQyHgNn54w=@vger.kernel.org, AJvYcCV8zvbWrRQ3+Rx+9Ootf+0sDAAmIYjgVMUQw/x9RjFZ/hqYv3YDHeCToYsnW5G46+GPZwkZP4+JxdBl7+E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxV3kn3qRcuffCMtAdxFnAPf5xAE8KbDAwjB5vQEo78qI458nN
	4DENh27S0bgsBWkmTTlMEPSISZKEdFJSnztCl1iVOwSWE3qAmgrSX5JmJmK8pfX1XTLdwcYNsXA
	XczIAmkuoexpHI44dS5MoOUl0d6E=
X-Gm-Gg: ASbGncv9KWLY7HcmMmyvcToCdihDwSzq2S8o0i7EedzcXGUSafY5aEcV/YO67kvTld2
	Ccb+kz3QWKTVVnuAclAUTktYdyBUh0GM/jZPruUXnSHQ1OUU=
X-Google-Smtp-Source: AGHT+IFUYMhX3+/BM1JggYJVuxRQGX3UytTr863qz814gKz04w2DqWjUwnCs2EQ+xU4dxaucEWZmaBFGqnFIKfgZ0YI=
X-Received: by 2002:a17:90b:4c48:b0:2f7:b149:538f with SMTP id
 98e67ed59e1d1-2f7b14955a9mr9005351a91.4.1737363659451; Mon, 20 Jan 2025
 01:00:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com> <20250120081938.2501554-3-shengjiu.wang@nxp.com>
In-Reply-To: <20250120081938.2501554-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Jan 2025 11:02:24 +0200
X-Gm-Features: AbW1kvbnaZpaZSDxHIyyEvAxF7UNYIhVPRDimqJRR0qSr95In6qztij86mg0ndM
Message-ID: <CAEnQRZDVTX2ARLy-5xRQtBQJ=nkknNQgq98zRDLqaHcDhiQEDA@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_asrc_m2m: return error value in asrc_m2m_device_run()
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 10:20=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> The asrc_m2m_device_run() function is the main process function
> of converting, the error need to be returned to user, that user
> can handle error case properly.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
