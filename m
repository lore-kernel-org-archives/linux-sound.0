Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C9051A743
	for <linux-sound@vger.kernel.org>; Fri,  4 Sep 2026 18:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788546031; cv=none; b=MwhuQcVZ28WWsOsugiTk0I0D4ThN8uvXuzUjnKuM3UkY1cCh7erjoRdkYUron7I5u6vZDj7Z7sSUfWQ9L1SEuxHU/9D9C7IqcyDwxLEUs7hPvBt523ATXkXbnHipAKhdHk6cIG7lBJO5KZh0hTJ95i3ArmdfwNAGf/kmIq3SolQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788546031; c=relaxed/simple;
	bh=byKejZtAl6q7TXNAGPeYbR4LCvKQMlBWPXFv0oHjhEA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hAV2qcfyrcMm6AJq43GhWyOCz78OYkF3oeLpjGQM5gHXwUV/mt4a7vb1xi0awsL+pX0VN83lDFHnVLXsplu5uFW6Fe58xYIJANw9rohpgK4jhM1yrRPCBN5nrGGjmLCxCMPOGSudGy8ET0iEuLFGhFiIW60nYYjcoszjdjh+Iak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC3WL4+W; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC3WL4+W"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc2276e6daeso1127577a12.0
        for <linux-sound@vger.kernel.org>; Fri, 04 Sep 2026 11:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788546029; x=1789150829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=byKejZtAl6q7TXNAGPeYbR4LCvKQMlBWPXFv0oHjhEA=;
        b=mC3WL4+WEbngGes0cuZkjNgSffbUd4hbsuivXCv2cxu4iL5dHXETt1uCkPWTIFD7YQ
         JtnYC9jDrcN0eOSP2NZdFRpbWtSD5U7bGm7lAoe3iNN349Bl8id3zcCQoxzFRsX8kr0t
         DSuNfUBZchNJzQSIWoPkc3HXI7r+suxEIcq7RZAnY5Kv3vGSytUcZx3vIzGu5KrAyNTs
         r1HqQXstoZGD3w271UG/ZzqG0IXVwiZmyuNcwDFZv8EZ+vpZd6LAdm38d3B/Msjxsdj2
         3Jl481p9dhzEySxqbPEUywoajCtkDR2pcnoEpeQgR1HR/H+JjNCU+7XWCxqAdyfAeNjv
         6L8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788546029; x=1789150829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=byKejZtAl6q7TXNAGPeYbR4LCvKQMlBWPXFv0oHjhEA=;
        b=VTqzc2QtNwuv7C+IcHYPTey5D7+m/zVpcRRNS1czFnKp4zXqvUvTiOpLBgwHKXmf4z
         62i71zyOeqt5uwnQORvDg3GHn11WfoXTc5kbKpzDVQuH/oTenGNT22XHXypa392OW4oy
         NVZLuIxB1a4LKnV6JZswnbJt/fpY7cTCqCfsjYz9qvh3IkAPw2e4/NO8ub5sFNaS62SB
         FbxNLZVNc7rsF43hKrByVQbJ4O+qfnm5a09paACnrND+keeq8Fe0Vtk2nQq4li4ODt0z
         bM4TIKaQLLGrq4/+PLXs/xqI2xNSrcHO1jJgNivnGmfviG0Bs1YXoE/mkzN0tFdS+2lm
         yBPQ==
X-Gm-Message-State: AFuF++lFt2umj8CrCJqUpGC2veV7Uc4uyclYk2Sg/g3n+VWMToi18EtD
	yCwfTitmyGGRqAecrJRc4NY30/+DREQIOJVfGKbEX8Uk8ZCocdnqnWcTbEEx9mLpgVI=
X-Gm-Gg: AYBFou3H79h3CK85Z1IoKJ6dMVADNGznGvUOX2RJchT6DBrYgr6zqm/cp3HHDGUWSRE
	bZQK5JdNETfHc28DCVRDM+EE+LwEvZXOEV8ylCGeFFbXnJsXbDfGDaxVWENOOOFMaovjUIaxWVP
	NZUATmKlJNo1VCpVC+j64OkVaJwBQPz/AoZ3zCnzKuGmeKBIuafTx8pegVC2uOf8UzwNeefHfyQ
	sM459sVdP+AhtMqCFjXe6iiEhc+PHHPVg3KWCDVE0J5y00HAyftDt/wTCYL1W+IKIvlk9r6b/d9
	Aun4ryPuhPtBApjlxw+gy9QPAb4brfJ/9cFS9Ru4pHZnvW9DUl10Tb3fVwBlvqe+5QFPzEirmso
	OvGOvDXRnycBgRBWMjGt924ug4tqmShy0x/f4aABgOrKmo0rUIaCixWMkOb1LwBgItpOGwXZ0bz
	YNQ1ERLP6RdtIKM3CuueCSY6J6uBwORYPCyU9OmiCLYvj/8c5dRmCrR37KI9jhNdYrBVN6y6XEI
	w==
X-Received: by 2002:a17:90a:d010:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39b26272ef9mr13588885a91.12.1788546028788;
        Fri, 04 Sep 2026 11:20:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:1960:1401:126c:876e:d154:517e:4c6f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3342af0bc08sm6350509eec.17.2026.09.04.11.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:20:28 -0700 (PDT)
From: Hanh Kieu <hhkieu@gmail.com>
To: geraldogabriel@gmail.com,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: add Pioneer DJ DDJ-SZ support
Date: Fri,  4 Sep 2026 11:20:23 -0700
Message-ID: <20260904182023.4486-1-hhkieu@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
References: <CAEsQvcuaNZvLxyxNH_NOy5qwTmkrk-A9QdVtZD0GiCtPwk4A+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Geraldo Nascimento wrote:
> Are you sure is_pioneer_implicit_fb() isn't returning false and you're
> picking up on a generic sync ep instead?
>
> You should double-check that function is returning true or false because
> it will return false when USB_ENDPOINT_USAGE_IMPLICIT_FB isn't
> set on bmAttributes of a Isochronous IN EP.

Good catch, thanks -- I checked against the real device rather than
assuming.

lsusb -v on the DDJ-SZ shows both endpoints (0x01 OUT, 0x82 IN) as
Isochronous / Asynchronous with Usage Type = Data (bmAttributes = 0x05).
is_pioneer_implicit_fb() accepts the capture endpoint's usage being
either USB_ENDPOINT_USAGE_DATA or USB_ENDPOINT_USAGE_IMPLICIT_FB, not
IMPLICIT_FB exclusively, so Data usage does pass that check.

I also traced snd_usb_parse_implicit_fb_quirk()'s dispatch order for
this device to make sure nothing generic intercepts first: no fixed or
capture quirk-table entry matches 08e4:0191, it isn't UAC2
(bInterfaceClass is vendor-spec, not USB_CLASS_AUDIO), and it isn't the
Roland vendor ID. So is_pioneer_implicit_fb() is the function actually
being reached and returning true for this device, not a coincidental
generic fallback.

Happy to add a comment near the quirk-table entry noting the real
bmAttributes value if that would help future readers.

Thanks,
Hanh Kieu
