Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795487602;
	b=Q+VkctwqeDtCuOExJqkiGa9YChVsl7MCZuk9tG5DVjIBfr7RuZ/RsydZlY6hFO6P8OrV
	 SJjU/povozCVHkwHTRPidMUGiW+eQZFdwQntzsVWYgx9HxBikN1b8bTrKQWeAN8vvuO9k
	 J2RIs2Bpxh47hm2FrGgQLPYvjxOaLaLILqUXTWp59IOJ4jLbxr0ZzoBYAtUsyAqXPms2z
	 2IPwTLktTry9ZW2rmTsDamR0OTOn3f6afrbTRuzznAt7zBWOtNhiqQsgCQeCv5nRDlX9I
	 KWcaKB9ycmIUSK9AHt/PiSKW/MqsrcYHh95ufD+KkuRvXez1s6xlfSvXPvfW6F8T4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795487602;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rOC9cj6HmV6O00HV57fzzBRSbxDYNsjtxPl7hhF26T4=;
	b=zsl8QA8f+lsCXEsAlCuWOx5Fql+Ha8wo6ll+sdXLj98UWI/dc1l6jKqSsBy4BWAFto0a
	 RIf+99+yc/kHE/ji8m+O8n+dD4mI3Ez+JcV5RU3ABpSV7kdw55nUTXSmcrFGW/2zCWk84
	 GSLoRBi5CW5KN5lUCkUjna52a8rI8Emo6KmbazrSww4DMRzp6j1euThcSi5uWukiTtq6q
	 bPozSI+tCpNYPF6BaCCr3PICM+Ob9lum9Suq62D85zV4CpOQVbX+BFCz3h71uSHtu9w1v
	 TWUIs5QIUvVjRC9qmPB7DqcatzDKXlbLGJ4/QJESp6+r03shPkbdenamd3u+iLoP93w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtrWydA6;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA41606A321
	for <linux-sound@vger.kernel.org>; Tue, 24 Nov 2026 02:33:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CA41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WtrWydA6
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8b600fae14dso1240514b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 18:33:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795487601; x=1796092401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rOC9cj6HmV6O00HV57fzzBRSbxDYNsjtxPl7hhF26T4=;
        b=WtrWydA6hm9AEyNZJHwUoD6ny2FvIL7TIJIg61vIXw+qDHnXF9TPr/YvC0YkNnzjXl
         XBKyUUdPQ+alZsPXaci1Sku1AngF8sId+6wYA3fs6rO7HPn8FKg2Lnfunbo3ie2vAoJk
         j7fF67xB2/tmzlma22HKZHbx7f4VhLw28cjkbGCJbzMNr3i/WJM/DWrQKUtUr4+PQkyu
         t8BwIetw3d0fGD/wY60/Mmj9fSUSyYMlajhRk7av7M2wNiJRyM+LemlifzfqGuIKx272
         zUw4fKuey3M2vx7MUUaqfTdkrVm6ewcV8HcrJQ63NM0/NJvndZ5I6fVJfLywfp0ql3MW
         ANjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795487601; x=1796092401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rOC9cj6HmV6O00HV57fzzBRSbxDYNsjtxPl7hhF26T4=;
        b=dAyKNQPUNS5WPTpgMZaVtGRlCOyBQQBk3JeH4vNn0LpqV4TK8LOA/lkD/lNVnt2ZEq
         Tlq55YVtJD3RTSrt3kajAfrRpeJ/QfD/cGBfpzRj5Aepoc5VQFS+t3WlNALSl/PuNgU8
         Y7N6B8jOcUuvcuKPCL2ELwRdseiS7gG/HumsNxROMDZ64c4jpAf7H95h40N2nbGobzrV
         UgiTtG/tztNnh2h8L3TtpsdNXVbgQeninFu6QowfFhXLCICPzWtjoMG8XkyIXusN3jkj
         851Xt1EU63qlf8kpM1v7FRCe572hk5WZq6/qvNCm0SkRwptc/nvbfFRP8jyVo5Q8khBs
         /QXw==
X-Forwarded-Encrypted: i=1; AL+hErEDc/KvMNP4w8MCW1EraoXPMkI/tLkNrvqcTteO8Gs+u5ueC0NwYtbLzhpx6iGECy9qcap1gFZ5ueyJYg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qcM4PqxSMzjdszsFLttH7049G6xRHnj5uR3RvjyiSEm9yy0G1
	y5yTjHegY7/lbvqQTvmSuf+EsGatUQyN3by/NqFBkT/tWPGPrc7WGHUM
X-Gm-Gg: AZFdTZcdPsHQbxklLeIf+j0ET66EDlHH8Tq5kHA6P62k1UfQg97g2EbFUcRGYQ/iSB6
	oMKVs/vyOq7kUkTW8xdh/idSCCGsqKEXHxpFvVEqVGKdq9m9mosfFLOw2kpoM5gQOYfhqg/5tra
	UFxHYAKnWNWWhVfVUsxHRHV6E4fdfGE/bmGNDP7OpfvuboZ9hv6WVHg48t0zWAn9voz0TgmClfG
	8N80mD4FwOcDZGY22iiQ/fzNiWUsynyUYjuU19d1r/Ie9celDpeY3TC6SDx8KuoqOBA3Y3ppbNk
	mH3vVLqM960ONTy4sfPAOZT1kqat4vU0JELzlc6slEUlczlJaUcMVmwaWoVnoljeEiy4c0FS4dd
	S2Wb+G9VFnPLhmJ6DWgpwYhJdAinnO0UkTrTgxcOgC+wz4S4zXfDoqmMCnQiiyjOPgedQ7lq4xW
	r/hpeLAOaZqMjOridXAoA2tVI7CYEkGGRS7Hhm927JqYl0pgiP2VG/Rj50vESIK9xdeEEoZA0CT
	N5gYuCFdsd+i6v2l1klLQd2HZ7ehgSclcd6cCu7SgAiYOHUyHi6CfbMKYppCLPsIqRpwj1ejC3j
	mkaK7eMVNERn+rae+tqIP7iek/VKksE1SMbKbf88+K1nq/S5p4jvVXGrhjUuFhm1KIM8f3u1G+V
	JJGGcNwtKRW7Wf2E91fpUVb8qI4fPslrpnOBpX+1F
X-Received: by 2002:a05:6a00:198d:b0:8b6:400d:7cc8 with SMTP id d2e1a72fcca58-8c87c672510mr11533751b3a.30.1795487601286;
        Mon, 23 Nov 2026 18:33:21 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c219sm6516772b3a.18.2026.11.23.18.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:33:20 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Cc: HyeongJun An <sammiee5311@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda: reject invalid values in the IEC958 switch put callbacks
Date: Tue, 24 Nov 2026 11:33:15 +0900
Message-ID: <20261124023315.435207-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123170203.243633-1-kapoorarnav43@gmail.com>
References: <20261123170203.243633-1-kapoorarnav43@gmail.com>
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

Hello Arnav,

Tested on a Dell Latitude 9420 (Tiger Lake HDMI). On the three IEC958
Playback Switch controls, 2, -1 and INT_MAX now fail with -EINVAL
instead of reading back as 1, and 0 and 1 still work.

Tested-by: HyeongJun An <sammiee5311@gmail.com>

I ran these with Claude Code (Claude Opus 5.5) on the laptop.

Best regards,
HyeongJun An
