Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A2E48C41B
	for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 16:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769014329; cv=none; b=b5YsX4R5vIroKRh2LwLSs//jaQAoqTbZqn4Fra/B4g6fueS9SlfHlBqq4FrO4/WQERqMfx/tn6RAK2fEAiA+E63rqq0BtnCagXNfne9YHkUQEkF3pdXJNQmuPOjI6Ust296IM9BILX9NznuAZZbpnfVnXgtr06/9l+/310G3mHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769014329; c=relaxed/simple;
	bh=4HRBjG7A0xNa2ZgGS4Ah4wBKvv4emyEssJAWSX3yqrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d6ZLrlGnTesXG5RflXPu41ROVc+kyG6JOTUSNKxWL/NQAvqZvu2tDE7a0Lf5ylUciqE/IyFE89QcrfD1V4YcjQwTMn5G4vRMpOP1J9iFfMvtdMVVdu2dgEFewhAOTmFH/upM80m+p5hDh+nBNcx6hNHw1lg/TwwiKb2H/CYqH3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7Op50E7; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7Op50E7"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-435903c4040so14558f8f.3
        for <linux-sound@vger.kernel.org>; Wed, 21 Jan 2026 08:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769014325; x=1769619125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhUfgSz7A2yaxp14lt5kXBlvsJX0TtPumRcsY55W6Y=;
        b=K7Op50E7vJdZNwShrzqpNy8Bo2RtCBJh1LRdxfRWDr3s74lHPe6OCASwzNCOtpRKVi
         spv90Sp4Z8xT7n3K+d2gX00pWINi7Fp/IrdVpl8srSIwelbwWbK8jrQMql4bSynI+1cA
         vISjT8JRjt6cL2gIShiMJnkFW6vZs366ru7WlsCCKikoB+1/0mC0M2nRzgl5H7SnQ036
         Nd0jegIkhAaumQOIsV2iP9oLPNd1QjVvj9LziaZx0osLUPdirRaRw6rvDNX52H+eBWSE
         RHHXKpRY3nvuGWtMEyxHKqMAtGIxnB4Zyr1ugyXt/TmkCBn8LYMG3tZ+MI6flsVw660K
         9mZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769014325; x=1769619125;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ihhUfgSz7A2yaxp14lt5kXBlvsJX0TtPumRcsY55W6Y=;
        b=DifPBZoDUgvd6gYsGNaGOAnaZX1ncMA87CWGMEEwSBxEhjH8vKdvC6EqsiaQbFiDSs
         G+v/ZnjNlGEP2AK6mHV+lIizJMNyJblv5DBSYiePnPRqYMlGIr9uJWrfmk3XxhlE1zBy
         wogH+tlg7y5CEWFfWjF9vAOmzQeD7MnJE3Ph3WgOcVtqJwsBAIBYA5xcjJBbXxFFDNMh
         RKm3ktFKg4bW1fhB5Pe4m7wyFur6V+BGQCwkrb5EZBSg2Mb9kZiPUanoR7Lr1zZFaSlv
         1YbHTuWb0amT8aCw/djsXek9L+FnglHQ59L5/ecv5PLWsmMTQnYAK5WpEfjNBDg2mkh5
         8fDA==
X-Forwarded-Encrypted: i=1; AJvYcCXvLriu5BEVgCBkGFecJzpuFhLh1xTQcChAaAbgx6YMxVP2t7zYM96SVCnpMPRODltzrVGXKR2mkFoK8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKoWSh1dfVPAr0xpds0ZVu5edxdnxBFeSth9RoiFw3PFDl2W3
	3CmjMynA6OZxDBCROF06w+rTJJ3JtPZfaCEa+gaRnoiEL1z/fHo8BJki
X-Gm-Gg: AZuq6aIUdsTAIkCErQEJcMYQhoE5LQtlKgAQIhEOc09BJtVAh0B4rllkc1EYCDk7GGX
	9oip3my8PM/7+zW92PeHDpd2S2jxR7zVMsq12ZPLB8RYsnDGKLYnKyGuwLrv8JZhwoMnLt/v+N9
	yKCcn8jPVx6WaMiUJu69QA5je4s6OvtVpc1JPnNXlv8dZvRsWhY8L3TlLuOhybjIzLFqqIxKEv4
	yxMnDTCmdOnld6nbk/zs3KHiEs+JYGI1RRKxJ0BlkqbpLJ3huK/b3sNLYFfFSjHV1C741ZkUZKd
	5xGX5l3pZ7aowINEMHhDkz5tdXBGo12sS7mjjxZGem6utqmWhIPW/plh+KSSN7+Guve1nOAHpvE
	0Yv8WgfiR00AlGjbahzORIkSvTzqbneITGxBYgstU438Kicg045couTosfTJNSY9ZbuVgo/YaSq
	v1wHU3OHKNaI8GK5eARoNhWEwjSzvHYhiIo6Oz/UDOFC3U+p9MisGaLSA=
X-Received: by 2002:a5d:4a88:0:b0:431:764:c25d with SMTP id ffacd0b85a97d-4356a053cc5mr22591618f8f.35.1769014324966;
        Wed, 21 Jan 2026 08:52:04 -0800 (PST)
Received: from anton.local (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435924ae723sm11119706f8f.41.2026.01.21.08.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 08:52:04 -0800 (PST)
Date: Wed, 21 Jan 2026 20:52:00 +0400
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/8] dt-bindings: sound: sophgo: add CV1800B I2S/TDM
 controller binding
Message-ID: <aXEC1f0gy64FY_Pl@anton.local>
Mail-Followup-To: Rob Herring <robh@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
 <20260115-cv1800b-i2s-driver-v1-1-e8b22b8578ab@gmail.com>
 <20260121163213.GA3413426-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121163213.GA3413426-robh@kernel.org>

On Wed, Jan 21, 2026 at 10:32:13AM +0400, Rob Herring wrote:
> On Thu, Jan 15, 2026 at 11:17:38PM +0400, Anton D. Stavinskii wrote:
> > Purpose: introduce DT schema for the CPU driver
> 
> Please write a better commit msg. Use complete sentences for starters.

Thank you for the review. But I'm afraid this is initial version of the
file. The current version 4 is here
https://lore.kernel.org/all/20260120-cv1800b-i2s-driver-v4-1-6ef787dc6426@gmail.com/
Hope everything from what you said is already fixed. Big thanks to
Krzysztof for reviewing, help and patience.

