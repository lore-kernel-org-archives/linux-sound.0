Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A3310779
	for <linux-sound@vger.kernel.org>; Fri, 17 Oct 2025 06:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760683555; cv=none; b=RB5Qm9o0LtONf4hWmCT6qTwOoJ9CmTRsGfuMkTF8e5Xh83w1SH5xjolNJ3Zk7pR0bUe+Y6IuXv8aG6+9fFdjXnfcMcbbYBCE0CbwUAcYOE1MRuGYVwWYcHh7NpEvZajhfmpO2ztbojiWc8REtrEIlmu82mpzmq4g5l3FvqjKlMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760683555; c=relaxed/simple;
	bh=Y8VoXhImxF1w1dbi0lgAcXI04oMk6uKN2d6iSlSdjTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jF63FQx7uRkjLEbFfySqX9pBooR1XNqglSVsS3WT7LoORcU/dSaw50bB5LQiTYsXVHXUViTR7zrJ1fuVKYy0cb09ohuWjYkihKjhV5Res7V/FWUFdvpOATQJUqhAg7rUQamRtE2bFmTaX7A02FjPUTwx7+tfuFuX0W0QzNtfg1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uc+OZZt6; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uc+OZZt6"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so17201175e9.2
        for <linux-sound@vger.kernel.org>; Thu, 16 Oct 2025 23:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760683552; x=1761288352; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxXwBRH3OdLI6ivv4eNJ4mVtVC/UotONZ6PQtTD+YIs=;
        b=uc+OZZt6bbuvCyutKKMIvPG3rVkJ2GIgOy5aVU3oE7vOzD4iXxA9OBh6ERxTy7Z306
         6oMQlEyYtTEcY6RMqDgtMo0KBk3c7SQTGcZx4O0PkbSbZeh5Lj/f3ET5DX448msxCLIp
         fIlPrD5ofd6qLa8I0I+vilTBnCF6OpGa0Pl41MZmELHLG7WEb/gGLSGT8UEnJme0OREz
         80XFbD/F4+ZGdgeRXqyWNQ5v06bb+q2uI1hguEZdJvA61akneZyY8cIbE8y0ftpS1EN7
         SnggNWsBVgZtWXUFnaDcjnY0DoAazpF6WIC8i6pZmE0i3wcCaWHfoyazoFoaHC8e1dX2
         g7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760683552; x=1761288352;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cxXwBRH3OdLI6ivv4eNJ4mVtVC/UotONZ6PQtTD+YIs=;
        b=UQGYUj6ttzsFRF/uuTRvIKNz/kN6ByBOpyXz98bAWCWcDTuMalLxZBmqTn10hrqn2I
         UuuwfZ4gJ2yOqLFng6gajNvr5aHPIUx5AumRvQCnVFvZlz60D1ysU3LDN1zb/Bnq1TGz
         ARoIn6Z6cj7C9uRC3qO7duNSOpRRfsJxVFYf8vL15G7Ffwy2ONWjlREvIeYScwgpZ4o8
         Fo+0uc/ZzKl5vC/EzqxT8l/PWUP4KJC2s/MAsD+hsROuGBeRMfn1TK1XLEkoJWeb1Tcg
         Sm+bis5VkSfOMXnxg/zKnwc7ypn9E+gO8FMjJnV+m2CszcVGd5H3XbmOGoVIf/2DYA3O
         lY7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXLMaUmRinsuFfwBX6to5vJ2Q/cuAV88jmRqlYLCYC45p+gETxSORIM6kPQ2v9bPg1BRK7cOMJFo0KrnA==@vger.kernel.org
X-Gm-Message-State: AOJu0YymL/3YRv+mjXmmvcTuipMnwPn9Yp3NSNwXaFs2qduwvd2AmR6M
	pnUEOVP8aqC0QCyUE8qN9VZZXrlrqiZ1B8OEPB6kCuBhThn29YaylYgsucH9zMfuvxc=
X-Gm-Gg: ASbGncsMvjPqSIECDQIg7LRc53462TDFp0tVd0nwxBfI+X3V4NjPUW0QhMA3TCLAIE9
	F5lOnx78f+wMDURbDAXLTJZHdYhlVDLw0n7fsSEX7N2395uusG4GcwcCuo/BOpZCma24cCK29rj
	HHbnj2RFwRwPKhcJtMwy+NEmlKXuxP5+LR+EBr0x0LCdG68uXq9sCTjLFtgRavLnveSPyyhKSC1
	/JGi+JjzyvK1ZuhhGv4tHJKH3BRthlIqsvC4/Ae076UBlg4a/yzpZy47KCBiYIHBor639cxcwYf
	xvGUCBYI91QJIYP7VeO+o3ZcgBB35DExLDfKPAKiMmy5SLOPusHV+/kCuHJTzMrC3VKYA0q77N7
	GPPR0fcAZf1TE0VywpoCruj6BplYHZ9nxw88RksWkHWonc3AmdfEUiQgi0yeg6TZonTapyG4t6a
	4EeTIL
X-Google-Smtp-Source: AGHT+IGkGQlk9WZP2Ulpn4AcpV8f96nPE/t/dP3omgDpA/THfd4k+GylVoGgGF64mCc4wmfibWovUA==
X-Received: by 2002:a05:600c:1551:b0:46e:2801:84aa with SMTP id 5b1f17b1804b1-471177b143emr18469735e9.0.1760683551674;
        Thu, 16 Oct 2025 23:45:51 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:6426:9b9b:6d3d:1da8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c91sm63630395e9.11.2025.10.16.23.45.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Oct 2025 23:45:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 07:45:50 +0100
Message-Id: <DDKE88TY46WS.1XKHP5I1S3CF6@linaro.org>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <srini@kernel.org>,
 <krzysztof.kozlowski@linaro.org>, <linux-sound@vger.kernel.org>
Subject: Re: [PATCH v5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles
 for audio blocks
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, <lee@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <sboyd@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251017061314.644783-1-alexey.klimov@linaro.org>
 <2e4e0ad1-a030-4933-8bc9-7b9782234a15@kernel.org>
In-Reply-To: <2e4e0ad1-a030-4933-8bc9-7b9782234a15@kernel.org>

On Fri Oct 17, 2025 at 7:25 AM BST, Krzysztof Kozlowski wrote:
> On 17/10/2025 08:13, Alexey Klimov wrote:
>> If/when pm4125 audio codec will be added to a device tree file, then dtb=
s
>> check will emit messages that pmic audio-codec@f000 doesn't match any
>> of the regexes: '^pinctrl-[0-9]+$'.
>
>
> Future errors because of present mistakes are not a reason to do
> something. This makes no sense because there is no DTBs with that
> compatible, so drop this sentence. We never document compatibles,
> because in the future they will be errors (if I get it right?).

Ok. I can hold it off till it will be started to be used then.

>> Add the compatibles for two possible audio codecs so the devicetree for
>> such audio blocks of PMIC can be validated properly while also
>> removing reference to qcom,pm8916-wcd-analog-codec schema file.
>
> And that's now incomplete. You add new device here and because preferred
> and sufficient is to list compatibles, you change existing audio codec
> child schema reference into just list of compatibles.

So the way I understand this is that commit description is incomplete.
I can change it to your liking, okay.
FWIW, "add new device here" is said as
"Add the compatibles for two possible audio codecs" and removal of
child schema reference is also mentioned as "while also                    =
                   =20
removing reference to qcom,pm8916-wcd-analog-codec schema file".
But I can change it, okay.

>> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
>
>
> I don't think I suggested this patch. What's more, it wasn't here at v4.

The original idea was to fix the warning or error emitted by dtbs check
but now the whole body os the change is your suggestion. Now it seems
it was not even needed at that point earlier which is a new finding.
Your prefference -- drop it or keep it.

>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>

Best regards,
Alexey
