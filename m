Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9009279358
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 04:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761886616; cv=none; b=aL7l5SbX8DJJx8oIob+2cv/Ccbv7tEBVqhdTfoSc0r1TLsSc32plddhKHjK5NVSdum6DrIjcHY9i5HQ3pdPieg1VD5Sc1UG6GJFiqEt03pl4i+urRWgWWtBtm8tn+2l4ZRbNRYzWWZTqBA/3eBCn0EUQHTFxpA5RwXGgVVyHZcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761886616; c=relaxed/simple;
	bh=RXiIl8QHy2RQmDekiRS+ZJE4djwIoThOX41hbOUjqNo=;
	h=From:Date:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=YsytTAR0G0E53V23dibjTlTlQX8BcjgBRCfBvTizzJ/cEP6IIY5VpicxurO10W20QfcpcU28V2SoT5LNIH67W1+9cb47UZbI4avB1i/ONL8LP3tCnh7guM63BfxBfehRNKI4KIatyiL7ts3Nfa47aJldIpmuuuNS0S6N9/GTKLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVUUVvQZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVUUVvQZ"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42421b1514fso1122584f8f.2
        for <linux-sound@vger.kernel.org>; Thu, 30 Oct 2025 21:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761886613; x=1762491413; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o3m8aq/RrYHBIP7bSVm+Q0EOZW0+wlH0W2+b0O6JlKU=;
        b=dVUUVvQZpVBRdix2o9qf08yA5A/zChGeTo+jjcpKMRUqQGK7ZH1xpuivJdNHHb4bCD
         hDCvLLUB4sZ7TTYzK7SbQRygxZzHBY2W0H8uSC3HBhlCZ04oD8SJ7eyuwicjg7nOrXqI
         GwrufQwr+EdFC9om6huDivDbCVznZ0JOnIV4CwWsLi/H/b08fsF3qdZpIdImNNoHMwSX
         PAzCisFMNoq5uaGKpqhtnL8ekpGz8kXy47G1BjqS1eD/CbjDUzEi2GUnl13NPSyCGO+5
         ss4A0XkLi9vnVax8ucaSsxrk3SlUmBQYoJUnl2aAXD9FQjkzUnYqnNOQLQt22YaiLyaF
         ixMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761886613; x=1762491413;
        h=mime-version:message-id:subject:cc:to:date:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o3m8aq/RrYHBIP7bSVm+Q0EOZW0+wlH0W2+b0O6JlKU=;
        b=eQhienslfw/v1TpXv0mAt3mbR21BzIgHto1Z0NP9kg/UYkBr7oJ1Al3JfQU3s1M8wW
         OgTAUGl5KudA3g59w6/ytcmdHjQVbnJU4OYTVk1s1PAM8EXjEzdn868ZmKYyF5zy+qLA
         x1/KN3CmTXKCzsryz/e9Tjt4wGxU5jxYk0/kcIHeFiPWGolpIabgrecEp27SEhb8V4eE
         UswhuRviKAjRcqgXf418zHIETVtnuEI+QZFAk8JUFYyRweHl7oMr7OMGwehMXgHF9b3l
         fl9YTflF3UqJzaKovaf1nyHP/8TXWrsqjUUjphv+1ja4mjDU3oeZ57XxwGD+q5cM67ge
         4lkA==
X-Forwarded-Encrypted: i=1; AJvYcCVe/hdgxJmCAvJEjkPZKDgDUHVdWSWCmOrmrOtQ45vyBSrMSQEnj+eRjdWGQHvCgSl8PSxs9du16vTgIw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJArz6qD2yUYv7lDX4itBKrnoBXC4UzEaBOC+V4U2neZ73Fz5u
	4CZOD6BcP5I1dzyZwh3J5kBlQnkka2eDvaSWsjyV9M/R6VwGlP8ah7y/
X-Gm-Gg: ASbGncvNuFFBhZTUgmQda69zwM6X1GWw8cShZ6cmgmomGFa0Ki2I4C93Q+DxwdYNBH6
	G3LkfJMrxaPStcpGbGu4QFsgHh0d/17L6dxf9O8LxEDtIYMzsOdpLnu/bVjPgYAb7VsDBpPVHIQ
	ee7PJfVMp4WJD9axSguM99F233KaNLGEQivbRFu49NGiXd1IiG2i7dlFmmuobx8uPBKXNRxTILJ
	dTdmtYIRwIl28XzAYJbwUnm7hrXq8099J0Jaq44rS2RPY2/W/i1K+N4tVrXpf2jIpkpU1EC+pa7
	yX68owC/80MnfDpweWGAl3h9DTvx9qrs96/4ZGZr/e/lUT5ce0t6XZlZI6mC4OoWhp92XFiDxAe
	bIG0TDKFejNuCm3rvj1/a0OFtvxAuuHjwZ3+R3s/eYHV2aWGAPRfPDVCuCCZN/SuaWQ/0mzJ8in
	AU/Qs=
X-Google-Smtp-Source: AGHT+IHZJzakzTgwlQHrJ/hVyQ/JzPNqC0OXG+Lg3olvwUpspwRFjhHXnZ1HB94EgEI14GhptLth7A==
X-Received: by 2002:a5d:5c89:0:b0:3de:b99d:d43 with SMTP id ffacd0b85a97d-429bd6895ddmr1557063f8f.19.1761886612883;
        Thu, 30 Oct 2025 21:56:52 -0700 (PDT)
Received: from [172.23.94.183] ([147.161.143.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c112413esm1351004f8f.12.2025.10.30.21.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 21:56:52 -0700 (PDT)
From: HariKrishna Sagala <hariconscious@gmail.com>
X-Google-Original-From: HariKrishna Sagala <hkrishna@gmail.com>
Date: Fri, 31 Oct 2025 10:26:02 +0530 (IST)
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
    kuninori.morimoto.gx@renesas.com
cc: shuah@kernel.org, david.hunter.linux@gmail.com, 
    linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC] ASoC: soc-core: proposal to remove num_auto_selectable_formats
 from snd_soc_dai_ops
Message-ID: <2daa603f-13fe-c803-17fc-4fdd8e5723ba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-437433266-1761886612=:1037"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-437433266-1761886612=:1037
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8BIT

Hi,

Good day.
I¢d like to propose a small cleanup and simplification in the
snd_soc_dai_ops structure by removing the
"num_auto_selectable_formats" parameter.

Context:
Currently,snd_soc_dai_ops includes the "num_auto_selectable_formats"
field to indicate the number of entries in the "auto_selectable_formats"
array.However, this count can be derived programmatically using the
ARRAY_SIZE() macro wherever needed.

Proposal:
Remove the "num_auto_selectable_formats" field from the
snd_soc_dai_ops structure.Replace usage references to this field with
ARRAY_SIZE(auto_selectable_formats) in the relevant code paths.

One effect I see is if the parameter "auto_selectable_formats" has
only one priority format because few codecs are defined as a u64
variable,will correct and prepare a patch.

Please provide suggestions, objections and also to consider any
compatibility problems,historic importance of same.

If there are no objections, I would like to prepare a patch for
the same.

Thanks.

Regards,
HariKrishna.
--8323329-437433266-1761886612=:1037--
