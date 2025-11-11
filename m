Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE67F2F83C2
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 08:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762848526; cv=none; b=FQh/8ROzPPoxduvTOZ2eiD4FKvUdGOVFg1LQr+c7x7gGkhKqKaJ6BgUZHsQ2z9NFjIoeoqiSkguFt7u2r6Uw+2ImhZFzxIuaba2SdLLinFQBoGY1U+O55cSN+Fr6Dn6Y8eX57kUbliGwwdpAe2nhGpIqlT2KOqb9ODzrFgbICFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762848526; c=relaxed/simple;
	bh=e5xzHBdFbmW0XwOUR4XN/Edk4I4Zj1jSK1DHU7z74us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SaClU7oCsBG9QxEUawj8UUbtYKI6ILzPYPCVraQHKMR9qv7L5CyBdI26NlCvh+thwPR62XWzAAetTjhVNAbEm9k5XlqfdaS3zrKWburthGaIQsZZCg5vJt8wawf3I3GRzSKalFnAL/67YSN80wyimFghdJMynG6PFpIJvfDw6qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eO60w1ga; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eO60w1ga"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29808a9a96aso21262305ad.1
        for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1762848523; x=1763453323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
        b=eO60w1gaJ+K2zEQpiYSYxl5NHTKgGX7UDr1tcE1JEpXD52hn8nwKQkjhpXrZ5j7e+f
         EeeN22XwN655jqnfUIUex//h7wnGg3jPNNOzAT8WFgBXNQX1UplqYHhNlN1tkwVCXn5V
         gBWl5GtK+/aiaKXOsn6a9KSSHl+ehjnmtpRCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762848523; x=1763453323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0w05K6KxFo07worIjxTlWcgaX/lcLwwSdDEeFRVch6g=;
        b=q9/PR2lXF0Ram4FUbZT4MrspzHR1LWzhGw2ZkZkyYL88K4zqq3NELkMsaIYNs1BufW
         mWhSsPw5yI/q9lNoJwMJyAdXk8jsrut3ENPD4Kqe/M/6yNUPiLu5XmzY+lwCFBFqbDAw
         jZpjjw+QgPPNXUihhtKdr2FgeP90djrEbgAkiqRcNBvJtuxbNz9dpLD0GtGDA4Hhzp9C
         mP9hynvoLIN189Gbp6dvbleXfdPN2kFDOV4a3tfiXC0O2Fpf8HWBSXZEmO3ezrDLnWFH
         zRLYtucFQAdqsR415UFfjZGReXYLXsSsz2QxMirl0n3MQNZaSkcNGypej+fxQCQ4ol+0
         smLw==
X-Forwarded-Encrypted: i=1; AJvYcCUet75gCLGu3kRpO5cC/zInsILX3J0P8DTWceOZAsnCJP+qlyJwH9EFEdwldryjK1ABbH/GSGo0/rbbKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVsIP0fh9FgWvfHDGoiTVPd2KE8y5t9s+Zc7Nwy0tE/WOiEfBp
	SjEDmvVQKvyxjYoYvda49Q4UAcnWKrwk7oF1antlvAX9fb6J5Oq9xEG4EqyJun3FWg==
X-Gm-Gg: ASbGncu/xSdEBqyYeDAJ6qHwJgoDqQgka02GQy76qHbSPBmBy+P2HYUQnvpPSaoEniP
	B7tpE+FZ3DDM7k1Vbw8866CnZHn7gTMyjZh8Fxd6Y843va7ZgWor2yLeyT7smHNvNg3tGqpMIMS
	y8vO1V70BWteN8NPYSx/R2v/loGiW50d/wA3kGxyJYqWrT0T0+8Ih22+i5D1qJdcLhOmklPwXRg
	KJhOF4/EK8llWkI6mXovV/LlbVTZRRt+0fCl55ZXWrahr+U81zdH+7tysmX4/6BGbtBEmMyxK3o
	2HApQW6XYAxxjfsrvVBgTPkSJ/qDcwdAIcz93Nxm46JXGFZfaNgNI10R3Hv3rgGpGiO9/G5Meac
	JEwV3dBOmCovMAcBeFmjODV+n0ztodNNJRddxq+dCk/vg7+76JTvXLK6ZJRSZJIlCJhKh3XURUf
	dV10Ku
X-Google-Smtp-Source: AGHT+IHC6xuDhDXvZKC9hTiDPjxDoSsReKjYtkLbxL1ziXkP+RR6tEjoFAFy33iKv0lQXU9dzXWwTw==
X-Received: by 2002:a17:903:2c06:b0:295:62d:503c with SMTP id d9443c01a7336-297e5627aecmr142808835ad.16.1762848523256;
        Tue, 11 Nov 2025 00:08:43 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:4557:54b2:676a:c304])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca4262sm173807695ad.86.2025.11.11.00.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 00:08:42 -0800 (PST)
Date: Tue, 11 Nov 2025 17:08:25 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Corey Minyard <corey@minyard.net>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Alex Deucher <alexander.deucher@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Matthew Brost <matthew.brost@intel.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Vitaly Lifshits <vitaly.lifshits@intel.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Calvin Owens <calvin@wbinvd.org>, 
	Sagi Maimon <maimon.sagi@gmail.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	Karan Tilak Kumar <kartilak@cisco.com>, Casey Schaufler <casey@schaufler-ca.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>, 
	Max Kellermann <max.kellermann@ionos.com>, Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-mmc@vger.kernel.org, netdev@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-pci@vger.kernel.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linux-staging@lists.linux.dev, ceph-devel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Gustavo Padovan <gustavo@padovan.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Rodolfo Giometti <giometti@enneenne.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Richard Cochran <richardcochran@gmail.com>, 
	Stefan Haberland <sth@linux.ibm.com>, Jan Hoeppner <hoeppner@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Satish Kharat <satishkh@cisco.com>, 
	Sesidhar Baddela <sebaddel@cisco.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v1 12/23] ipmi: Switch to use %ptSp
Message-ID: <pvjnjwm25ogu7khrpg5ttxylwnxazwxxb4jpvxhw7ysvqzkkpa@ucekjrrppaqm>
References: <20251110184727.666591-1-andriy.shevchenko@linux.intel.com>
 <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110184727.666591-13-andriy.shevchenko@linux.intel.com>

On (25/11/10 19:40), Andy Shevchenko wrote:
[..]
> +	dev_dbg(smi_info->io.dev, "**%s: %ptSp\n", msg, &t);

Strictly speaking, this is not exactly equivalent to %lld.%9.9ld
or %lld.%6.6ld but I don't know if that's of any importance.

