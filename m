Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3C84A4EFA
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789461922; cv=none; b=cEI2mD8ILYe4gmCMx4I1t16u/InO4KGz6qFIdkiGd6U9RV9ESk+5ak474jZI3YwSXjqY38/OidG26LdXS9EZn+v++p/ly9xNzFDiEHaAEuSKbsnmSG+aPRm7lDQEi4SVdDdaHKoKw+rTh+6LwsaVgCNIFVe+H9WDVGh0V7SeB94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789461922; c=relaxed/simple;
	bh=JJEh4YAJ1Ay2ewBI2yqm76bIt6T06gfWmYFb9OyhK0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fdEnC9cjNTWqwSOTqniW54ULS1uAVjAQHOdI1UGpeqOYbCsjXm+6UbJb+Ivwm6O1hIqAoclSAbYSS8EOwISjFYprqoJCRRSU2U7LUn3ZjUKVdQ6xA4M3ZS5TakiNKaBp6UCd+ahf1xMEXVI7VT7EbXUz8hWkmZKmI4jOiVN17DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACnep8l2; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACnep8l2"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so3071783a91.0
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789461921; x=1790066721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tZI2a8mxGmbedcX25r+wjJ7cUUr+VErYdMtwf8Y1lyI=;
        b=ACnep8l28gZvUECVjSWT2SzT4JVPT2rYaepkeD9aHdl9iRVQL26yDaR21QIjNCh9xy
         76krpr7otnqZRKU+y6S3j4o9dxf8Oju/H5fnVxxjsWzxfWbJbVYNyE+EAACOHRgeY/ER
         2NfBDvbSNKr90QoHvhYGbaa/N2hsE3HOMzw0fjIC9ynJ/8QRDd/VDk4JwLt/ahUlyPpt
         MjJeDLbcL00nVqSSoQfCOh5hMkQJGuXW2QYIpcCAE3YFasJEzHuPI1joxVXt6crnhb0Y
         3n7f9cPVdpPQsdS/YIiqm2Z8fxUhB9VPQ2jhpyVFOt/YJnjQeQXdCABOUVt6fa89v7Ui
         raDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789461921; x=1790066721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tZI2a8mxGmbedcX25r+wjJ7cUUr+VErYdMtwf8Y1lyI=;
        b=XcM6DOs/cHeD8gBBOwXj+yWRKYvgV7056Fquemr9c3Z9sJiYdX4UhuZ2VywcjVMq1Q
         Jp1Qt0dqeyH62WO/rpBzF6mRdV5D5ndRg9fFDJxQlJrBQLm65kmLbxsKgE4/IrfSCd1y
         iZlxt0lDRowJdDUbc71jihD2x/15Hul5tSLEgh8CNOYqOoGQzrckyfGwZIoJHIIVwiIp
         FfxMpimWJqBUxreWqLsHVeFX1uQN/fXl2oUi1qpEXlPB8LfknbhZP8vWOXTQsTBzwmxE
         asTMnlkWd1kpv7qJsI2lznXi7ePhFUpZfNrLE+xD2et/7jfcbLj5J8CkB345STMg5+Za
         fYKg==
X-Gm-Message-State: AFuF++lqAPFbnE6sLjyIDIJSLN30Lo1tTpAJz/W1yKhfa9N7qa34G6DB
	PBj3oHmsy222nd9+qrGIJAgh7uy9PuBZbiwi7PvAsMCeUlvbhxe6tdi6
X-Gm-Gg: AYBFou1Dwf+13EI0Nc8FVgP4ONN71Asi/DeD8p/IdDFo4X9PbrBCFKZA5f9xQ5wj8cR
	+hmi1wRXvsjDpAnFqVa5YgYE0v/HExe0PfB8nsHwhwNj3AKjr1xApsaxL+rlxVEPUJxdyIhRDoM
	l84T/q17MmjEt9TEA7IVHlhczXZgq3MfAjMFc8NYeuSEVtDnV7J8GFZS45vaZseYIhowphi85HW
	BY0SwkOHD1VPB1VuxH81s/aOtehurhf6H4+wqSQo4jhDLHJ94A21WdiM1yYfyb20RVzq0HvTzmQ
	KxWYat/FsUyLSSMCG80LvLBN+BriLzyvWPUYcgjF67fZYSZKSFhU4I/Ldd1zIgM2+iZb/RB30rZ
	kantRb/AiY2Wn8529g8O15RNnlqjM9ZeYRQ+uPLmYs9TIqxvDVWJjdZXjR7NnnCOhhukDA9Iuhv
	5vEBSsirqeSaYuhmq5hlLJSi+sqRGPRCjsqdm9mzKIQTl9zUcSm8tLAGKfPUpd9UWMJ4ZUbsClb
	Sw3dzznNH1gx0yD15xLBDO9
X-Received: by 2002:a17:90b:39ac:b0:39e:261:4e0d with SMTP id 98e67ed59e1d1-39e026159e9mr4070187a91.25.1789461920196;
        Tue, 15 Sep 2026 01:45:20 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm34718935eec.3.2026.09.15.01.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:45:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Clemens Ladisch <clemens@ladisch.de>
Subject: [PATCH v2 18/23] ALSA: pcxhr: fix typos in comments
Date: Tue, 15 Sep 2026 14:14:19 +0530
Message-ID: <20260915084424.1007757-19-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260915084424.1007757-1-hemanth.selam@gmail.com>
References: <20260915084424.1007757-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct spelling mistakes in comments. No functional change.

Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 sound/pci/pcxhr/pcxhr_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/pcxhr/pcxhr_core.c b/sound/pci/pcxhr/pcxhr_core.c
index b3b9ab4f303e..f855d3bfad4b 100644
--- a/sound/pci/pcxhr/pcxhr_core.c
+++ b/sound/pci/pcxhr/pcxhr_core.c
@@ -802,7 +802,7 @@ static int pcxhr_prepair_pipe_start(struct pcxhr_mgr *mgr,
 					   err);
 				return err;
 			}
-			/* if the pipe couldn't be prepaired for start,
+			/* if the pipe couldn't be prepared for start,
 			 * retry it later
 			 */
 			if (rmh.stat[0] == 0)
@@ -913,7 +913,7 @@ int pcxhr_set_pipe_state(struct pcxhr_mgr *mgr, int playback_mask,
 			if (err)
 				return err;
 			if (state == 0)
-				break;	/* success, all pipes prepaired */
+				break;	/* success, all pipes prepared */
 			mdelay(1);	/* wait 1 millisecond and retry */
 		}
 	} else {
-- 
2.48.1

