Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052196;
	b=ycqiUwoEEpGDAQZE9LseC/J2rupoPEyK6uMzt4UCpocGhSvsLg2ZHA14KDGgbX2Tgv6V
	 VyTwCepefP3Ayr/FmLwM6BS2VpwU/9S8w0kQ7WIhS3oxM9JAqmrUssFLQtS+lsFYIhgdm
	 DYonuJTH0ApXxTS1fQDt0Qg9/Nd/Q30AbZlYgJIQdX19Jz6AuyIlDkxul87JbSt1KSHNY
	 +iIbOa7wFfsmJPV7+0KJxeGjtLw+53cktw+5MXNDGXouM6q9pvAwE9Uyc46nR7/RBr0cu
	 4QU4U4Eh4UavW/Bvs+kBszgmQ8gAMkrY01xTG6aG2Y/6e/dqfw7pV1ASxAqNco/iHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052196;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XyAS5PiGbQrSz8Sx2Wo0A/xoKEH1rMSm+d+qex7vHLE=;
	b=2DhhGrb7qWqIw28a3VYplPEginLEHnNE1iiPvOxPDDJr9qI5G/DuHZ2rRBbmDgAeF3Ee
	 bz9yJT9Bqc0CFF124bzKPZBiioNzKdjOAN24vNv1SsdLjKwxyWMIa1WX0lFIPDop2p0Hx
	 b+kLq5Ymhb1oiuclMXZbglNepeuLDr0DluBC3rJAzHBsUgK8/r4MgRJRlCey0701k6VNH
	 5YCBRgJfi9kXdIix62FxYAtrEPOVz6Nno0Z4eaQBrAbF1N5krWK0V9OkNsiIcJJVSDslN
	 tJdNBTJ5PTE69yPMNxvUIA+6Qc41gXjWhOqXOwBcMvtdcVIVYkbWyGF14v+VDWBx8pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2gssrG9;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075E0606A326
	for <linux-sound@vger.kernel.org>; Sat,  7 Nov 2026 11:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 075E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y2gssrG9
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36ff9c9da34so1985605eec.1
        for <linux-sound@vger.kernel.org>; Sat, 07 Nov 2026 03:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794052195; x=1794656995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XyAS5PiGbQrSz8Sx2Wo0A/xoKEH1rMSm+d+qex7vHLE=;
        b=y2gssrG9r9aWshWT9N2KWz1L1QDsOs8zNzWES5RIg4Olp3op9lbevJO5j6m0cSp6xq
         ZbKXTuUurXZ0T4f9vPkghNu9DKBmdEtiv8nb86U4YMX8ICYK4rcTmFAVqitVDbxrbsir
         fk5h6IcQGe3j7N2oJHD3ixjekD0WBVRKeNqtuMWFFNOLcVcSuC8fckW1yYOaScwX7Hcp
         jXv+Zp+oEs06ecTKrJBmrwtZtLIu+flVUAD+39J4UH/dnNoB+e1dSypVfd9Nqad/ZG35
         U7JJnpOwaFPw1SzArG3z0GeviOQmGuSb+748RdfyuIOW1P8BHGRqZS5tRO/0pAREGOch
         4KNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794052195; x=1794656995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XyAS5PiGbQrSz8Sx2Wo0A/xoKEH1rMSm+d+qex7vHLE=;
        b=zNlh0VHkP+BEhSrfbKaoujiO1OkBKrLGqNXZmKxYM37LwnKpwcqK1BVikqujHjZf4s
         aRkBqUuceaSlwxvYtMEYuwfVQz1ilpGEYMtfZynLF6/cwgV/0MX8iX/EPzmyC2L5fsTC
         37M+FpEeMlmu8pjlBA3MAuBX7SAWkJPXQP6Ba7DWAxxy8fkNUyBfXIha1hzn2dJSKj3d
         yeKqQm1HDEy7A9pVjxOtd3X+HPFkSp9APfnIGbSAl2Npq1vHEKDmsirS5Q70Nx+5rbBc
         9VIU3VPUXXo/sWHFaMNF6bRO1ESO8ftO+5puf63THddjMAnIGxWcZTpKzvTGuMjFykde
         RmCA==
X-Forwarded-Encrypted: i=1; AL+hErHeklxujwyNiO3CmFjpOlbvxf3J3l8B8ATK8fXbSlmFa47rSVRDeQUrss6Jb7chG4Liw7ar188lHMfjVA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9OHkTXVQPg2qRIpeqfX6qTKIUo4FB6YZiN4QINhaFOuawfdsSE
	UDrgQOxB/pmzRgRLMN/YNVXo1F2tFo3UkIS2IJcWsTQiga9sqT6zyTGG
X-Gm-Gg: AYBFou0RiMs+Wvr88u1SmEnryT0+ahbKmTKXdjxktAEDkcsjePL23GAVTj42KJ9j5ZZ
	tr2G9C3WM05RUOYmk9nuiSXhxHgfYyBgsRtpUwEVx/UpJrSqfb3HoRoomkraChAOGh3EQmcsfdz
	sda0hfT9aJyqdmBv63/+X9yP4le32VvDqhFe27J++RxCOM7CURn1t99QdNq8PYrgx4RBHICBAqn
	uPXzLfoD0K8fy1zCxO3Ql7bxiUTPSPM0VRQNtNe4fKBbNePZAbJxMgKcjTrq9HtiiTkzlKb2eae
	A12ILoBtGp5p20DIxtocriDKQDnrBAOH78sxtND9SeDTIMZCht3cA/r2eyw67WdegLTqD50tVG0
	6DLCzUYongrY5MeokWmMW2VLVudDrX2BNOcRPLzkYPmY9Fz3Wb+4wrEGIKSml3Tb7V45P0am5up
	iL/UC5wq6x+MZTCcoWUudvDW1Fwcj7lEFE5JECDEss3D130H2KNeqsooL7M8vJE9414Znzdge0s
	7hbLkNpnaDBST01bjmK3akW+Ei9g4X47GmDwr12wkWMx8l705o0ju91RN/5wALBOiKSgQw45cyH
	fYFa3w0KJtHc3bcbCQrhPSOGEwAQwabRO1K8IioGIfzcvDwjazVi
X-Received: by 2002:a05:7301:921:b0:36c:9bc6:3ec with SMTP id 5a478bee46e88-36f72cc1d9fmr7685316eec.3.1794052195020;
        Sat, 07 Nov 2026 03:49:55 -0800 (PST)
Received: from localhost.localdomain ([103.177.253.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa922c6c7sm19845277eec.10.2026.11.07.03.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 03:49:54 -0800 (PST)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	sreekuttan2156239@gmail.com,
	tiwai@suse.com
Subject: Re: [PATCH v2] ALSA: control: Trim whitespace from sysfs input
Date: Sat,  7 Nov 2026 11:49:17 +0000
Message-ID: <20261107114917.2601-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87h5htypvw.wl-tiwai@suse.de>
References: <87h5htypvw.wl-tiwai@suse.de>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for applying the patch!

Best regards,
Sreeraj
