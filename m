Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFDF48E0FA
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 10:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331517; cv=none; b=F56ACOCsEatjqhnAHr2ahYIleH7EzNObAqjwTFgCS0PFtTPYlFDceUzj+iJ3dBssPZpdjgWuynzgh18OjzUM5YIjiO0n0aTANrxRFTX6yUduhqmy7PHYhb6kFgoL3EObR1oziRTKNe7bmcrswc0Nd3AAGEBsROV1/TF3wP/zRsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331517; c=relaxed/simple;
	bh=AbQdBqj49bj37Pnn5gBhrLYqrKsApmp5K7k5jiUmA+8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qu5UW8SXm+mJj0sQ6uMX4iQVOx7cM1JD27+9UYgna79Yv/za+V+98tQZw0nbDQnhDIVUDOEsNvc6gOGUEbUes4157thMI0p/FK4+g3RzRrbdQj68kottdjfYlWtwBVeH78pGj5gYPHwnx+RU2YernEk+U/GXm8+iqYL2vIMY+p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N25+xQyJ; arc=none smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N25+xQyJ"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso1086420a12.1
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 03:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331514; x=1790936314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtsATQAvwWzq3tttdr/vRLT5iW3ODN1iCt+NsOWKe2w=;
        b=N25+xQyJqsyJqluts/3gADohh1copx+dnGw6Hz9Y2wqbMe/b5dauJm+GakrYkCMCCa
         lQvmB44Pd1C4X1f7OqsMQIsqaqrmS36dA+G54Pf2EMQAEJHkVOMBTzhsP9Dhq7jWQoO6
         yEipXccacO+fV5Ox1VTBPgkLHDiTF/3FHTbrvn5YhZQkpCG4mRZX1c6Qk7szXYy65sMk
         qcFSSPDpwabwq3F/nhea7KlEzVBIBFdi1EsnofdkBCvSILEj6T2pCNJsUM2e1zIwRLoS
         7hszWGrlvVqvHSxq+zdcCsqKm3MxdvonlUNBVgiGhfb0XeHhbQcqevgupHlHXqoS9GvJ
         AzuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331514; x=1790936314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtsATQAvwWzq3tttdr/vRLT5iW3ODN1iCt+NsOWKe2w=;
        b=BI5yKiiKlyWS/jLHFfykp+KkBt8uUgQ0X6IbsRsa1h5i7ar1ZVJdFSDqT+JV+Xy4V3
         ENVeOajFbRtyVdUMAFlkafM5uN8Yd5CtToRaQXTfqmLcXWdfkS+s45aDB8H3E++9zJ1r
         sbwYWTgxJGSNIs5F3UuiXB2fOToQ9TZAiIwpKQHtOicBBRcGcEnbNc752h3qjrPhTx+k
         p5CpKXudOv4iDS0HXAEQ4SBaVWGrBiv3rZWFIY0zeAqT78TrDfggoT8Q/gwIwG5DQU/7
         7qjEEG2HbooIVLB5NmT0WZ/nMbGZxzYC6ctRZsiJSui3vx9K1tJejk+EFgmm4apXh5yD
         +iNg==
X-Forwarded-Encrypted: i=1; AKwUvBy0iIirAKryNNm1NXhvd+Dje4GJw7ZZXbl1484NGZeroNvyj/p0y03WTRScN5AwwNlEp2Jb0FFwby8Wrg==@vger.kernel.org
X-Gm-Message-State: AFuF++m18ZbLnjjfQETLh85tC2BkrP9AOdTQG9wXdqWto11NWTxDYLAP
	rUe8VoAy8nr4o3KRIzTU1YPE+poSXcCQtbjNrP6ehy2Viw73/EVC8jOB
X-Gm-Gg: AYBFou2p8jB+rp14h8Vy+ai1ROAt8YwFy5BCztaim9o6ry8+XJMskifoVhpd32wuGOY
	p5eViEc7DQ1riwWjP8s3N0OMiPcT+X+4ylJ4ATJKiop0NhePuDvI2/VurBzyBN0sTHBesD1hAzG
	FRO24mja3Ne/Hzwj7Z33hTpNS3VEfmza0tIvQXbRuYYfUIKsWpYs/gZmQpc0xVL++v1dcPB90qK
	NjKOPYtQtKuzSCNnoZKQiLznaVHfMwzYQ2tMNJPJiXo6Nza8yLECcq3ciGT/2RobX4riDylTFwD
	lt5lDlYeJ8/Yi1QinSd71IDVllKjpZm7VB4zqd/zill8Zt7baJbPE2wQeCOsvFBz59Fl0Ri7Zm8
	gaK1RAhDe88fnmz4cCABoaw5AHjVNPE7hNXxzmksGAODaVvvP5QSKIGsYPCE3XqAOYyTfJGFc+9
	M6WSQJApUARdy5UegYwVlhwDQRuZYqnFNhtfXf8FYlGqUUGbgdGLzJiEey9wnQqVW5GHHRXknrw
	4Af
X-Received: by 2002:a17:907:9289:b0:c2a:d65c:c194 with SMTP id a640c23a62f3a-c2ad65cc78emr228455966b.29.1790331514319;
        Fri, 25 Sep 2026 03:18:34 -0700 (PDT)
Received: from [192.168.0.46] ([63.135.75.98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae84ba822sm87933466b.7.2026.09.25.03.18.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:18:34 -0700 (PDT)
Message-ID: <92b1eece-9dc7-4b33-9ec5-fc94300038f1@gmail.com>
Date: Fri, 25 Sep 2026 11:18:33 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: arc@gmx.li
Cc: drabik.p@gmail.com, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, mrwillporter@gmail.com, neil@androos.io,
 perex@perex.cz, tiwai@suse.com
References: <20260919151840.24371-1-arc@gmx.li>
Subject: Re: [PATCH 0/3] Add Audient EVO4 support
Content-Language: en-US
From: Faaris Ansari <faaris.ansari@gmail.com>
In-Reply-To: <20260919151840.24371-1-arc@gmx.li>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thanks for your work on this - there is currently a regression on the 
latest kernel versions (7.2 onwards, as well as LTS kernels 6.12 and 
6.18). Trying to set the volume in software like wpctl, or pwvucontrol 
causes the software volume to be pulled down with it - I think it's 
something to do with "sticky mixers", not completely sure.

I worked through troubleshooting it here as I originally thought it was 
a wireplumber issue: 
https://gitlab.freedesktop.org/pipewire/wireplumber/-/work_items/1022

This patch should hopefully solve that, and avoid the usage of external 
kernel modules like https://github.com/vanzaho/audient-evo-py (which 
you've based your work from)

I'm not exactly sure how the process with kernel stuff works, but 
considering a regression on current mainline as well as LTS branches for 
this device - is there some chance of fast tracking the merge of these 
patches?

Thanks, Faaris


