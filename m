Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C615308F32
	for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 08:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778402092; cv=pass; b=NVBxTFLRoNkJOgbS/LQeKMGd2EqvvNEvnE7/8v5abfgkDQsfky950mahzviUtQhOw7sQZSdbaeLz94SSWzcaj2qq+q1tCnCms0XpJn55xkO4fMK3mNrur6WG3tzMYTKNXwoWfXtDBKqnllDkV0XQeRFpSZ898cFI+BTiVN6/JLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778402092; c=relaxed/simple;
	bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbGmlcm71K95ROAynadwWptz2RAswHM7twF24IpCR7VrfVhrGD0WIkpRZ77UTiqeTH/mfLlPOvvmqsJ/T0LOnh2Q8yiF3hlNM5vsd2iKoMtRwfUtoZy7THTHUaXRyjNk/zcL6eqFubbbHovEVInKW/S/yUqMCRToeYBR4O+76Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1sX+HyD; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1sX+HyD"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2bc85eda6b6so2923105ad.1
        for <linux-sound@vger.kernel.org>; Sun, 10 May 2026 01:34:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778402091; cv=none;
        d=google.com; s=arc-20240605;
        b=HmFedQuCVv88W2bbP2lP5BKZeAZAvOS2OJfE4MMylazogkuQvyr5ahhQFlBRfEiGzi
         COGe+ExfXXq/e/W9yvhUg4sh5BEXbsBtrKX8iUYUpNfvGexVuhbtiHUXl8NKyE/NL8N6
         44btlvCB6PnTmFZzbAEsUINkR5mgkru4B4IEVSGemWGo1UnxoOy3CsxFJVa18dgh8+wH
         Kwks+W8O6iOkb6xLcjx9REmXMvwzQ6oV61HXPt5wqrWD6RH/4hINNLyhNT3qxdaQRIWd
         Wzecj89Bo5XVuND0o5kcaBYdo5Jg792c+vb9C7unm6F5AyNRzBj7v4p3lruw2DKVka/N
         ywEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        fh=YARl9BIkjaiujOYw+iEmrD4vnXaRgFeYvDZDm1bihHo=;
        b=VFOVAnl3CRg/BfFLnxp/s+cnEFL1WBliUDOd0ZK1aLRPsVCMbL5dl4Akzye/kEqzuO
         Gl6XlSxMb5piqXPNqwxXx1MvAbRURtr1mapujICPCB6uJG5r6+ic3ThSNKIz/3kLlOA0
         X1jZKFDi439jDQ30CvrMEMrVPDrITaf3A50di/Iu/dbVBh+m7et/Pu6KXR3uefjiZM8W
         cMRlC1vVxrHUxTdHzdqKMPI8AR7FNuro0ukppeX0BEld3XfBJ7vNol6EksGsnsWBO8Cj
         hB14DpEgMsTWGQ2cvB5GFKdmIE6RTEqrR9fHdrJ/506hHSvW4x+4TznwPKNCSX4LdPyp
         gEdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778402091; x=1779006891; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        b=C1sX+HyDQAgmMdNHjY3sIz4GOi7WJ2B4jFhkkVU1shNs2RfqrfDUgtJTTn5QX5BnD3
         NexD3QBMcE3ITVD0DHdDj14tufdA2K3nZUu3ljoHkLoObZvQctgbLOJimlvAzRnmRknY
         cFUeMS0+rZxMC5P2FvyqKykCJjO0Q8aiWxkYYEvXvwhEIkKq2TsfpCnRH96aQig94L6k
         oAqCKQyS02BMnTzxHZwfbsgTyQvOFwmlpsGEUODFDvpP7Auw0Yx8oiAEPn4KzBevBll+
         iyInjt0H2+PWUEdn2cVEA3qBbRrtdiC94x5kpuofPaDJbn0V+iITSwxnSWoggGGdB62k
         HslA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778402091; x=1779006891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02l/NBVcMEYBtBRSG2GVWGs5GL3pWUdRLnFNE/9StO4=;
        b=o1LPdRzqVJwUZ5lSEHcKcHTUWr8HtpTevc1PQ2tEVNQyXlXYdV3CY7+i3vMTCrqY4o
         2KGNFaPwUdwj/nJCHXE4cNaxNYMx0NCKC0YsfD4Oh/ZmjHMz9nqxmFeF6oavAgwhPIY+
         hZfiqfzvRX97pitHlR9+HJClMZiEpmQFQ1/M7EOSs+u0EHRGO7qg1RATiPrKeDkx+pPK
         FVu+DROLIV32EmIOj2cJCZoHAaMnJ4HJsbPDq22NZkIZmmoCs5VvOTJVXY8YaOiD+mX6
         24Dn+l3ItmirJEGwAUNZGBr0VHca5HqSGpQ9TYRtR8Y2MsE9dOy3kX9DaKUoHddyNm3T
         Oufg==
X-Forwarded-Encrypted: i=1; AFNElJ+cCsihM819IInPB1xldOolQI/oNrWS13r5Xf5+KxGoEhznf34sHbDX/lf5tUAbILILQQys/L1jjc3VJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg1X8sPT43l13L2UhF4mhr9eg83ityTf3ndb4DtRfuzwwihV5l
	22ooKBxDYlgzU/4wm1ms/ZugvT42fBa8aKXQhtH8zlwC4mfankgNbDA5RhoUf8KluDLpc559KCa
	PY5LAnvs4jgzA46iyJozi0a4wyycU1dw=
X-Gm-Gg: Acq92OFgGAb8ZiGjH59P/Y0Js9jutIDFofaA7Ysp7roc3HQ3n5LBmq+CalffAq6flq6
	pBDpDC65nVp5PYgV2wED/vDgb+xo8nUzCyrdx1NxBjkiBW2mEobfMSz8Ca87PwbKy91f3ViDYIh
	dwh4oEMG3ry9aw3qvr4qIspE7PU+IhhE7evIi8/B+SfCtSfnpkNJMLI7y7CNYgxKPLCSbs5XGZX
	u54NzAecKDcWpegACTP4ylpo54RXfEvejBF40iB3Z0JMkJB4qP4KzxRLcTDEBMbNLRrx0NSnil+
	JgLdRp/w9/lz4Fqv3zmS6yZLNur8Dgv6Up4acQ==
X-Received: by 2002:a17:902:e547:b0:2b2:b117:1d5d with SMTP id
 d9443c01a7336-2baf0e4fedcmr101160115ad.33.1778402090680; Sun, 10 May 2026
 01:34:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413100700.30995-1-phucduc.bui@gmail.com> <20260413100700.30995-4-phucduc.bui@gmail.com>
 <87se8ypeq1.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nGB0u-Y7ddGtu0DmZXUiEWTVrXQy7DhTkLgkSBvFjNyJA@mail.gmail.com>
 <CAABR9nHiSxH60ULks7_jZCC5rE+YVu-u+nm3TnO7oKcFoQduhQ@mail.gmail.com> <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
In-Reply-To: <CAABR9nHiaw_3E3=id8d5GW3t9XBR7c2WrYU8Hsto=F0siVa-KA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sun, 10 May 2026 15:34:39 +0700
X-Gm-Features: AVHnY4JtIFjXEfpi29lPaktBvsTRJzvsyk6zoeOhoHMm2kGF0XKoWYVx8WWmEro
Message-ID: <CAABR9nFw8RL8_emWR3qNLmoG-hmkHAgoEBP+4odN2kSyTSmtug@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] ASoC: renesas: fsi: Fix trigger stop ordering
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be, 
	magnus.damm@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Since there are quite a few related patches, I will send v3 directly.

Regarding the optimization approach for in-flight IRQ handlers, please
feel free to provide your feedback on the v3 patch series.

I will make further adjustments in the next versions if needed.

Best Regards,

Phuc,
