Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FF5439350
	for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 20:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784752492; cv=none; b=DcZeGUnSOhg9315egrzowi3QF7JoSy6CTXnq08MZeACk0PbTwP0RY57RwhSHy9wymzg1mlF1GThDKdHvX/sbaM96EudBKG6xfeTi45Kteco5/mC4XMF0dHk51WhUiNxvzn+vAVApokfhPAQcpniHAtAF79LDWQXEs2wGT+SoB5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784752492; c=relaxed/simple;
	bh=rkDL+w+g5I+rya7FyIvoZ7BhxGu8YhgLO7IIpbs+tpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ulrzfw5zTpSdWdsWixcULI54V4evLHtiyEQrwG8UB324fzBod2MIWtJWScjmZrMqz3uvI8mg0MkIa+2BSAHTHVAHEnTKXNPoo+vLIh/9kLR7ueE247iafX6k7njJpSDvwsuXVI1RYiCKz649/wfv9Ddb/wYiVd4Boyxn9pGtUfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OVtP+5MW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVtP+5MW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956242332dso31298335e9.2
        for <linux-sound@vger.kernel.org>; Wed, 22 Jul 2026 13:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784752489; x=1785357289; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rkDL+w+g5I+rya7FyIvoZ7BhxGu8YhgLO7IIpbs+tpg=;
        b=OVtP+5MWkLZabIbQWWcmxe2AfQ6iZtPW3TcV6XKqEm3C08ggSR2vaH/AkwBM+aH0uQ
         E/8lTOKkL/8oJtYM1IofaKxaSpEU3idmh77EnOSA9cZ/9GBxB6qnOufPGRPVynGOcM2V
         v2+owMAA6lh7QW7YQvZZ5+zdmHLgXWVR9RLXaCd6MFEUGuRc2o7wU3E8ogOmCdmx7nS8
         PRsuBWnJhg/LkiN6GBBWa29RyAvGTeWKwCzO7qCZGuxyJbXcP1x1XBuZkQ1NGboEVus3
         iFrzDFcO2nOIO+WUSkkDakbr3+XT10d7USBu03iReHdWcb6Y9sLzuPoJCJ4dKaeYo3+y
         tvZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784752489; x=1785357289;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rkDL+w+g5I+rya7FyIvoZ7BhxGu8YhgLO7IIpbs+tpg=;
        b=DUi0mfaVoQvi71ubzRimAN/GfflGOqQGY1CkLC58k2HFeVp/qQZQ3sM2OlJFwtjpbW
         zB8pU+EEGED66tnAeDJywzyXUuX+kmbZW0Z1Q3EvdQFYakb2LrQ2+TGX9ElWrBmYYZgQ
         5hEwQx0+YhEFfpNVHrQ13+fi1cT/U3JDQp3gzaiPLI0JpEL2JXGaURAwh7JtlJHJFabd
         2UQUAvRGOtZVGsEjnUtk2NUfUjH0JmK4OLigpSRyu+tmsEjya/+NxXLOl+nF5SVUbTww
         SNVNPUAq5pL1E2e/4HxoyCb4jKP5wWtSwju/MoRq/02aQ7zUTM1qS54TQsn2bzj4XtRr
         gUeQ==
X-Forwarded-Encrypted: i=1; AHgh+RoUCPL5tYy5febWbFzjnLct6gZbZIQ+U1AkTVo/ELvKLq2/e1lKE599J/N39MvL3Y7h1R94HTXtQQd45Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/yACP34CNWAyb0ZScFgYGim07cY+aIO0ve8YqSB27f7uVS9U
	uQcXIrSECM16c+PqPFT3s6GAEb+KE2DS9NYT2soPcm57QHqZLhOIUAME
X-Gm-Gg: AR+sD13djzArF9BE0L/eKrUYcCS0jub3Px+Yb48+rKmI3+dtbKJyBzllJIpgi2y2sYh
	aUmM/h6f88hAsnY1tbwJAkBU4xDxSedKilDGykdujrDi+31zk+tSiJUaNkmIRoUIopIhzunR9iC
	G4lOGFP3jG0xJvnISPE+kYpCyeoi5/6bS4NDZnGSpKyC38SvfnzKvz991b/eKGu5LjsDchux6EE
	bFcotfe4s7xoteVdt+e7RhID/Ss+DVxhXv9eT++Dzhe1OZ0YqbyMQ5FkAAIsHwm/GFr/e1toi23
	O8S7OV/+cD+UeQXmiXjBNKd7Adrp31Ii7Y4F/Pwyd7bKxMr6ZwVxcFjnhU7PezMbUUd94Qv5x9A
	hiCFGozoLYBBJQVg8nnc+RITQ3EKHIaeGSNVKb3p/Or75cDEJp8ofzELnofPg9p9uNK5UUkZGmj
	hQk87s9KeLP/RyjKHB2vBOSbZwcX7xdgYmFao98/Q7NFSXW/mmHp8A9YxWgwcSuVoQr9MGFg==
X-Received: by 2002:a05:600c:19cc:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49573cffa42mr2236195e9.18.1784752488856;
        Wed, 22 Jul 2026 13:34:48 -0700 (PDT)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a967289sm93558325e9.11.2026.07.22.13.34.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 13:34:48 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <3b56fedf-95c7-432e-868d-f6f8a0368ce3@gmail.com>
Date: Wed, 22 Jul 2026 21:34:47 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: fix unmet dependency for QCOM_PDR_MSG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: srini@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, arnd@arndb.de
References: <20260719022242.139472-1-julianbraha@gmail.com>
 <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <qhrevlgsup5xtnxhhmon5cjic5utdhc2mdviczylqesw6yjjzv@s3kk2dr5vk7o>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 7/22/26 14:47, Dmitry Baryshkov wrote:
> I don't see this commit in linux-next

You can see it here:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f2866e6a27f7cc26111ce195ddf00d4050bb27e5

- Julian Braha
