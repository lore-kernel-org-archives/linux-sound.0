Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9948338C40C
	for <linux-sound@vger.kernel.org>; Thu,  9 Jul 2026 10:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591266; cv=none; b=HykRlD4aGNnGeFtarVShVLMuVL92cnHpqgFvD34AMyCGMazm3Ni3SJVugGu5mca+so2UFkqWKy5csNLgxMgAafZBQhBaulC32F6yVwZK6DU4SHxxTK4U4+t233Csr83sZCApttlmGPPZDlIBjc4nSjzFpuf1l4H9MK1p4TJmZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591266; c=relaxed/simple;
	bh=ZjrBT03tpVAQN8hCs4F4FAVRcyDNR8qZcjH+dnga9tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iSTNUZZV/5JBpv7MGChRHo6Ghbk8okha2LwLipnczBbxC/93NmFtvqLeiYhlKHJPvKGIUS7FH5UsezNWs1yVq6Du+PzVoeWbYAxobIfFT8iwatEl++yWF37QZ2jZdihLjOLOhZpxZKu+RAcAKPVf3SNM9Qak38V2/90Y/qpKzPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2QgFSOL; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2QgFSOL"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7e9ecb1e13cso1990383a34.3
        for <linux-sound@vger.kernel.org>; Thu, 09 Jul 2026 03:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783591264; x=1784196064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NspW+c29jFDspcugqDyFu5pQDqmBWkpRAcY27NdtlTA=;
        b=V2QgFSOLxUPOhmaQh30oddjMcn/T4vGVtbBTcsdE+CpZn10y64n0vP5sLv9cUoK5Uj
         NNblNVAEkeEYbhtjodeEWbnQHmJNjgK8bbK5ti6Iw/DwOSRMij8f/mcWRumBJPVK2D6Y
         9eEkOcNBjwGsPGDwpdTUArbqerawJMcw/5X1mo3d/TA8xTSlTdwFbihHX6u/FNQ31N06
         sLjhrIVkE6Pe3r67nwdYb36IAYu9Zat3w2KYfwSAb1g4xsqpmT44FtgBzCVrgkyso3FH
         u1rRjURYiJBRui1S62FlcMbMLZPaJSu2T3xMd8j22gKGWc53OGEYmpp4RgewwFPrRXb1
         BOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591264; x=1784196064;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NspW+c29jFDspcugqDyFu5pQDqmBWkpRAcY27NdtlTA=;
        b=mhWAjIQ0dpyw1PV82gZtn2YvFfEOXUIjSHKeLe25BqhxGBCKXHTqf8zqZiaF2Ka4s+
         NRdOk+nJ3trK+qeRaFyaJ1GbWRwaIQT8Ktb9V95vUizs5Ww5fJT0hovNJShdDmFvqi5v
         J6+X+1Kjgn7UvgkwAufQUraB4ZkEssLf/biH7Em5uQv88GV4zmUWP2+B+y0ltvxU+A+w
         9pFx1tO9quH1Y1tTCzkDlc6Sxo05H1NrIGjcWkQFKSS0v6y63s+uT/4GaJrOIAJ7AU7e
         YU64LzEa2mwVOFFUYoF8eQOqCja+MLGonBjzFZoZ7wbJ2VDzT3B8311gRCfYNJY9e7ug
         1Y3w==
X-Forwarded-Encrypted: i=1; AFNElJ+IW4qq1mh0m01SA2K3qgqKjqoTpuDhs6Nz1tnYce9QyUPVOJ8cdt64qk+evnz/Es3nEIN8k1b3REP0MA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHiWIL4+syK6QCBFzfzICZ56RCpL6DO+dovAqWNE8CE3KzzSUe
	5Ro4tGrXcUySIobvSE/oDKoqcG8kauz+3TtA5iKTJIQvU4E95UTN2VP/
X-Gm-Gg: AfdE7cnNKUUGI8XBsBHMxcWE/E+HTbhA8n+M8GeiEfqtmfdrODzzzImcgfVRXa0zUQ8
	T4HVW9EJl1oT4YDY/ZIB6Sui15F24urmgopMuHcqStD7KKfdUZishFMfCA2Lm0FGtJ3T4TLYCdU
	rsDweruQjPy2dpjVF1YHxIZFyrSG929dd/+rWYd9ckfJuZB/zsRwMXBdPdlwCB3c0czmAE6axGi
	igkm3hZO1bNdEvcks10Kwxrk/qECPE75nN33eqqkeoZGTAUQCwYVqAu/qmNr9IT12BdCMUF2ZqT
	/TNBcqVXeWtr2ffGMeEoxJknh8+Qrhew4QchlXEt1ep32DULFs8knxYGlvt0iwpfUKogQtMOrFm
	JbojYvbWxAs9/oqsIkpHd4vUcK8G1IikTuLTfPyaqoZjv/BrWL0sBwqbo/c4JQwlrOHEaaUcU9i
	W5EaVh
X-Received: by 2002:a05:6830:a8f:b0:7e7:aac:4cc9 with SMTP id 46e09a7af769-7ebcff35968mr5312610a34.3.1783591264385;
        Thu, 09 Jul 2026 03:01:04 -0700 (PDT)
Received: from localhost ([74.80.182.70])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcaf7b484sm3740265a34.10.2026.07.09.03.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:01:01 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:00:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: phucduc.bui@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com, Kees Cook <kees@kernel.org>,
	Cen Zhang <zzzccc427@gmail.com>, Len Bao <len.bao@gmx.us>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: oss: Drop redundant nonseekable_open() return check
Message-ID: <ak9xV8VdUT91gHZk@stanley.mountain>
References: <20260702050236.30751-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702050236.30751-1-phucduc.bui@gmail.com>

On Thu, Jul 02, 2026 at 12:02:36PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> nonseekable_open() always returns 0, so the error check is unnecessary.
> Remove the dead error handling path.

The idea is that it might return errors in the future.

Also the patch is kind of sloppy...

regards,
dan carpenter

