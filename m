Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C53081D6
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 15:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774626884; cv=none; b=J0Xhe20cziBNw5NUYSTFE53rb9kFIVNyx9BgBqPHU1GsIxfHKBvkohy666RHdGOTATBVyRQPssKTl+iDMlUMNpLHT4BgYnYscirgMIJmpo3aYwyvhU2AAo1XV8DmVggVGMrZsKZyc8d5fLHuvv9lCh2Y/HU9hhjnXP4RB/sdP1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774626884; c=relaxed/simple;
	bh=zzSbOPoClVKbq60acpFDjMOaP4mxFzAvxme1wcNBow4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZyEEkrEmKvkuANwrM8s30vQPvozhadc4TQojYTvdHJY2hkGIX1lN0bJ+2w6YFbE4PUYzAtU6q2lbHCSyQ8uzLfuCcPqHeSVB96J8p5wFEZfEL/eIC+KEl3jz36pcyJNe+CfMkI0eNe0NjY9BRHzVCod+kD1XJw3HNhi3Ij7TsRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net; spf=none smtp.mailfrom=howett.net; dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b=XJRUhUJ3; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=howett.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=howett.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=howett.net header.i=@howett.net header.b="XJRUhUJ3"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d00cf835b7so296966185a.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 08:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=howett.net; s=google; t=1774626882; x=1775231682; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xY2jDKFYAAR/eXhSEi5E6NaTu0+5uZXyKvR3JmnzjdU=;
        b=XJRUhUJ3xWY0axuukUozveJ7/v6Rykri1os2jR1/0kTCZiQu3Pnn9znH2g/yQUx2JI
         Pq4+l/z9f+D3UVOCLLOAvEw+kN1ygYQ5qyBjV+a0n1r/vobCbk5qFy+tGb3uspQ40Ay+
         eifh71x9aQpZmHft/hjfINn+fQmzBK3y6K5Vq7/ylEjxb1YmxUKPCxhH0vfLfe4VErXU
         0JJCQaMYIqcVgLCbcj7Kr38BmHkY4uWKHUPXNdLfe3GHNHzx9m5Xv3WxzWTVh67BYbKl
         oDSqNS1jxlgz70QFOzMo8tC8dCBlCKGlnOggLuevj58Q5onhwE3QiR+KMDF0nJmB1/SU
         0H5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774626882; x=1775231682;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xY2jDKFYAAR/eXhSEi5E6NaTu0+5uZXyKvR3JmnzjdU=;
        b=K2mnU/QNSNvPIxkcdILMVkz49gHwSJ/9w+bILQHeZ+/SfpaxtsXXhfMqDXNuZAG8y/
         9pu0ZRhBicBlDL+X5dlpiaEKqYj+f0GQS7wyYM24PrdBt/ijChZDucAwVF3WeXt6soWD
         95qoP0VKusF/Q/XFGg+mXD0CrYZdJA+LaZBViJuY86O/UF7jERwyJs16yb5USb3DZ1fg
         k3IheFdEbXPxFbgYlruc9lRRomlpXFP1299S1Bba9YVlPLmWHFIGGLY5XJxCCaM7DgUJ
         ruFMD6qx8rzvJr49a3aPYobuMad+vc/4cgyQTohvfBZ/v7N9lbWnW5eZrojP5SeReYLd
         Cbhw==
X-Gm-Message-State: AOJu0Yx0caIWIK+pnnPEnVBPDZC3E/s4JxhVcvplNNM8sXtW1ZskxdL/
	2VjFj2VYTCZqJXlKdC2AQb+B4FflHBAJwughWGGgPuGGsPZQS9xIMZ8BquJMs8LPRw==
X-Gm-Gg: ATEYQzxg3rwl/tZhQPhbv1wHEoHyvi136KkQmeNfYtydhn6bjZigEAxvysdT/lN6gMV
	2x1kY7yebnlLhms5t0OJ6hyPo0qSvTq+8WdOVAiyK0MNQKTkZ94jbeWqkY1oiDKsuFJ3S3LMp7y
	tjQlK57DhTEWOoDb/5ci1ixqPKwJA3BfiS/aISBhByiHQ6psnK/yKA8zqV+aKaPmxSKFC1ehRWb
	uxRclG23HaptbXQXKh6OPCby+xPHWLa9wBmdcqNouAW5QP8wjwIClwDNzwK74f252iIKFMR+KTY
	M2GBF+Y5KDbj9tvlLXC/ND1Ls8TByDaS1Wvj2lR6phEKGmjhsjAXXVODwuFp3FtKoS42xRPMcoR
	EHdmW++9KeAtP7q1eaSRarjks5JxWThJak00WbNU0etfe2DCvSmbg23o7/D9PHARnDnm1k172yO
	/zCwZuTz30k7UVLpKCfEjDvJ0kGcVYzET6QQ==
X-Received: by 2002:a05:620a:450b:b0:8cf:d62a:c820 with SMTP id af79cd13be357-8d01c5e9d40mr383059085a.20.1774626882176;
        Fri, 27 Mar 2026 08:54:42 -0700 (PDT)
Received: from [127.0.0.1] ([2600:1702:5e30:4f11:3862:ebf:9f6d:8784])
        by smtp.googlemail.com with ESMTPSA id af79cd13be357-8d00e52cd45sm557470585a.42.2026.03.27.08.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 08:54:41 -0700 (PDT)
From: "Dustin L. Howett" <dustin@howett.net>
Date: Fri, 27 Mar 2026 10:54:40 -0500
Subject: [PATCH] ALSA: hda/realtek: add quirk for Framework F111:000F
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-framework-alsa-000f-v1-1-74013aba1c00@howett.net>
X-B4-Tracking: v=1; b=H4sIAD+oxmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyMz3bSixNzU8vyibN3EnOJEXQMDgzRdi5QUS0PT1DSDNDMTJaDOgqL
 UtMwKsKnRsbW1APzmAZxlAAAA
X-Change-ID: 20260326-framework-alsa-000f-8dd915ef0f64
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Daniel Schaefer <dhs@frame.work>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, linux@frame.work, 
 "Dustin L. Howett" <dustin@howett.net>
X-Mailer: b4 0.14.3

Similar to commit 7b509910b3ad ("ALSA hda/realtek: Add quirk for
Framework F111:000C") and previous quirks for Framework systems with
Realtek codecs.

000F is another new platform with an ALC285 which needs the same quirk.

---
Signed-off-by: Dustin L. Howett <dustin@howett.net>
---
 sound/hda/codecs/realtek/alc269.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
index ab4b22fcb72e..2cce0a79cee9 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -7698,6 +7698,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0xf111, 0x0009, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000b, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0xf111, 0x000c, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
+	SND_PCI_QUIRK(0xf111, 0x000f, "Framework Laptop", ALC295_FIXUP_FRAMEWORK_LAPTOP_MIC_NO_PRESENCE),
 
 #if 0
 	/* Below is a quirk table taken from the old code.

---
base-commit: 46b513250491a7bfc97d98791dbe6a10bcc8129d
change-id: 20260326-framework-alsa-000f-8dd915ef0f64

Best regards,
-- 
Dustin L. Howett <dustin@howett.net>

