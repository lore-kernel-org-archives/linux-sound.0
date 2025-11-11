Received: from mail-oa1-f67.google.com (mail-oa1-f67.google.com [209.85.160.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883602F83A3
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 14:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871853; cv=none; b=C8iizfsM9673OrUg6NV87M3kW0HfVIgI83Stwt6aDirYT6LwjLbrTQSBK2+6D+/jRVFrPnNwUQdqeblL6F95vP6NUxcUEIaFoZKMW7ZCPUbSMtyprc9Sl9nPQXLATdFdRYZ50kTGsrVqEg2vyzqGo+5qEnwAx/qFnY8i80jfb7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871853; c=relaxed/simple;
	bh=4vsDOO5vSHCFgZxshezv4v4YKIlkh5M/Jf9eZEgWohI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgRjKulpraigixTwWFsRaqZknDfBL8DPnJBrAa+YhTrlrnKyqhXCwtRxcFaAqU9LktFSfL7Sv1XytFZtAbinvBIyiNLE4c6+19TmBg+0qOuiJWeggLzyexRKQMpBv2u3+5vvgP+QtalxRsHWTkjALl4RqWP1K+M6dwLMmYBLsSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net; spf=none smtp.mailfrom=minyard.net; dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b=U43BjCby; arc=none smtp.client-ip=209.85.160.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=minyard.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.b="U43BjCby"
Received: by mail-oa1-f67.google.com with SMTP id 586e51a60fabf-3e2fc677775so3397682fac.3
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 06:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1762871849; x=1763476649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI/Bx88S/ljGSNn+PL5Rjkz6jNPZ9Ne5hLvzfkx+saI=;
        b=U43BjCbydBu0AvYWOJfyesW3uSc4neTpABwD0LD2AHdoHcgkgCRk6jNPbVlX5P5T63
         4aybYvunq3l8WZx+/LIk+udfT+Tsjd5WRzrOhXHS4pa2/STYg3Efr6VTc3USVmbVTZPu
         41PmIHTWcn88eEJWasgfdrMVUbnwdHGRUjdxsaRgLeXFLwnvjerMfPMoNdKu2Z80wGI3
         7BGUjj3kfSRBEQyl/Ci7ziOLevN1/fn/lvaCDwp4I420/vYfdQhyd6YprPTLupLmLbCV
         5nLCz8uJkE65sSA4dggBvbWWvh9IJAsy9JKS1rtE41tdbd4nALcyQNSKmGa8nWU6JDjk
         NhMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762871849; x=1763476649;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sI/Bx88S/ljGSNn+PL5Rjkz6jNPZ9Ne5hLvzfkx+saI=;
        b=sSbyF6uv4EPXDG7v56t0IK7mCVLxMiZr2MfL7Nuup3PnQLAxsLUQkgFGYYJt406EA8
         FiWO1qpxSxtAYGNpavsib6AoGvt74zhW9n2xWs1F6xRQH3+SV9WQJuOPAYRTJCINYnsc
         p9kHpPBsKI8FophWCitCix9rOwm6Uxm4u+tD/9kjM5hVzWu1KS7KHhnBtoJFYuR9Bge5
         XE+xxh+9VtT9MWhQDKZIfs/462RtA7yHgpNCEOjWMB4Lj7fjZeSBZXXJfWvKk0midahB
         mD9T/I9EH84VWb0Vd75XDNh1HsWbsCHUMO3vQzL5jyOxPipyAp21zrYiCunEIC7r7a2C
         u81w==
X-Forwarded-Encrypted: i=1; AJvYcCXNjcxADJZOknHtLbQ3jyFIuD0lcQ9jBFY2cqTQdKvv/VCncsgE7+h4QP+EB+pYCWOIOrDQL8sz7YePEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMiTPDbMX++onTT3ko2jt6K0fwnHAO6e2ILp684YieN4vtnGa
	0YcjVBqgMiFyc+mMNESMWdX82TrRnJupIfFimN1YGEC+BrRgwMl8o/ejgD3AgQdWi2w=
X-Gm-Gg: ASbGnctfr3hIJlXsdB68u4bTxqgfemuL9YhnjorSDJZR2tTPkthF8Vr6L4NZLLKzZqk
	uvXMxXQ4R2EnI9/1OGEixRujHgkV3O22lWWfPwzesuf9cwIsuQ6WQqP9/eoqVqBqZ0rI2CjtUUp
	phKeSHfsjcmBrJQDKO9tIB4hup3M1aoS//Nz0fd34/qXPm1H/K8XWgMo10LrTUWLU6v1cdEoOlb
	Wx0hlyhGcvfBn93ceLLYK3hUL0BPHXdgYy+qWctTeN3QDHknjlX71B3AtPoauyTb1eyXeLk0gvI
	n/oBd31P/BP60bUIn3lX+2uapODUlw3aAG8jdlkzAy4GxcKwRggAdkKa+v111CSv3fgJYttT6z7
	8GMe3cDh5X0045oT1TXg1DLxXnbHSEKwGPGK14wiwIc8m8RBVx5m+W2kVP6H2TUW7EZVjWUMIsv
	LlhY4=
X-Google-Smtp-Source: AGHT+IFusuA/Ax3anjd0HIltuToxJUS02/udclYoHdoDI29Kk3VNxq4/rhyMyYWudQr5f0WcO3jkBQ==
X-Received: by 2002:a05:6870:4792:b0:3e7:f4a9:588b with SMTP id 586e51a60fabf-3e7f4a9b0bcmr4110818fac.15.1762871849590;
        Tue, 11 Nov 2025 06:37:29 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:b4e9:19a3:cdaf:7174])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3e7d6f7a27dsm4861066fac.0.2025.11.11.06.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 06:37:29 -0800 (PST)
Date: Tue, 11 Nov 2025 08:37:24 -0600
From: Corey Minyard <corey@minyard.net>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Christian K??nig <christian.koenig@amd.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vitaly Lifshits <vitaly.lifshits@intel.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>,
	Sagi Maimon <maimon.sagi@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Karan Tilak Kumar <kartilak@cisco.com>,
	Casey Schaufler <casey@schaufler-ca.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Petr Mladek <pmladek@suse.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org,
	netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org,
	linux-pci@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev,
	ceph-devel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Gustavo Padovan <gustavo@padovan.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas Hellstr??m <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Krzysztof Wilczy??ski <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rodolfo Giometti <giometti@enneenne.com>,
	Jonathan Lemon <jonathan.lemon@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Richard Cochran <richardcochran@gmail.com>,
	Stefan Haberland <sth@linux.ibm.com>,
	Jan Hoeppner <hoeppner@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Satish Kharat <satishkh@cisco.com>,
	Sesidhar Baddela <sebaddel@cisco.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <aRNKJIyk2ne39ScE@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
 <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>

On Tue, Nov 11, 2025 at 05:08:25PM +0900, Sergey Senozhatsky wrote:
> On (25/11/10 19:40), Andy Shevchenko wrote:
> [..]
> > +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);
> 
> Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
> or %lld.%6.6ld but I don't know if that's of any importance.
> 

Dang it, I'm traveling and used the wrong way to send the previous response.
Sorry.

Anyway, yes, it's not equivalent, but it's not important.  It's better
to use a standard output format.  Thanks for pointing this out.

Thanks,

-corey
