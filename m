Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86103AE194
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 06:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762581; cv=none; b=tjlDvLKbUz7BC7rFTC+beIXt1SUC9dD0ugqupNmJexk3MIHzKPXDIGtR570t7swBM8oYUCxJRy2lElkFeH2qKSkGNltCKQrsESwaFBVtGX2wBQnU49Rb2atQn8KrKi0bDh8kT2BDOTmT4HfFMchCVW+zKjEpSKoRz5v0EwJqf1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762581; c=relaxed/simple;
	bh=m16ToxJmWoIxsrQEcF7hTXZXCv5JSF4tDG55iChznYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B6PqBl/MdQnz8vqrQSdPLEqRQJBugmdvVJquz6pLLNT8tJv470EyIOb64GJ8I2X1YNx6a/JoTHFWREiMb08ZKtxXodO1S88XT4suanyH/ANJKv90dITRsxzTJ9BW2tS43w/phYScCg/42cAYRYSWjvzMPHw8+ov/miZtXKb2tcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQlhqHzL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQlhqHzL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-381b831d535so5329891a91.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 23:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788762576; x=1789367376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5hRMrKvD5zd28iXJb4fJ8d4Yox7o3xWoOBxDTEiH8DA=;
        b=MQlhqHzLOkOuy91QagbF4DK1RPxmfZEY2Gc0J1ajKrN7jPyYKO+H51CHajzJkViHd1
         p98l+EjgIk0KlD39XtChQvzhWBa59M5rezFnU1h99t6DBJyziuLWEf4ImnDgBRVVHcER
         HgoexS8oJZqyBs9u3Fc0JaKgI0pc81guwGUSOD5KCB4n1qCHTlIN/3eVUodBlSFCRwMN
         Y+AdW/5BDbMyGZN7tYTwccphRJW3fqNftMtN6pjPV1Z61sTB4jS+D/ZiDa0J4PEjhZc5
         ZiZxgbyAmBr1pFue3qq6XFzha85hPOBOf47oPUKEa2R7BVKgxjJlTme1Dgezecr9RfUH
         1qmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762576; x=1789367376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5hRMrKvD5zd28iXJb4fJ8d4Yox7o3xWoOBxDTEiH8DA=;
        b=RlPwgh03lonrUtkYe45EWb/Az/7oMdntrYBn6TheJ2mYPjB6y7lLzhyqiBtF84bIMF
         5lkGEimCphlq44IdN51oiXAEwW8agqN+Ycd/UCsu/QXDDopBxUZV1Rl3pATyGK/FxkdP
         y0QwFxf7IBKcZC7VCXUorJwZChGuO2SREVQH/HbLfsvy3/HmqVBa5hw/u6XTolgObdON
         6FJkN9SnrmkM0x9EkPm5DC8UFFUmPY2jmSiHqrI2978tfADA9vi8tQg6Pl95ANEnbwaR
         6ky2oDwdhEPefbi5+FUFmJIOaycw6dY8x7Tlsuv/QzXeuu7kxIxuJ5fRZS3/R6rex+0w
         PeFA==
X-Gm-Message-State: AFuF++l3zPvRcuZaHhgSPvlOrkSuvIhCP9TDVvkHNkUj2wwa6jSsLrVE
	Wx9TfUnwgP3+7hm/mbf9nZeeXgbW6/uKx8iZiZt3T9f6GLQOpQGmDCSP457evxyzo6w=
X-Gm-Gg: AYBFou224jL21YPIdcSuXDhN1PkiBhhj0cvcamNz2EGKzYY5H9acSpD3zwCXEoycmoh
	58WTJ3iVKecGJY0ycyFj9AnAN2mMFB2LnIGhnsHJjMyWJ5kPe3f+92No3rxArcDFMMhLgevYOkj
	k7CMJ37nuBHKkNgwJEwNQBSqtZF8WjqYmYE6kriXvsnUbrDuH/8EVWtoXgy0bgHE6GBNUiL0Scl
	DUuqvd9VbXIRTsDLBFCCTZXB+pvWdiq4y0i81YCQJJRURDGJojJb3QOxfV257i2l0SCD2cpKTvP
	Num1U0ymiaZa9sa1tyg/FQksff2FEJL1BM7twetaG8IOQ88R7Qd0nYYUgSBl0ISPi3Qx9HD82AT
	PguZb6v76N+yG6mtdppbSsW6l+Ws7YN6KwBazgjjve8xQrjurrrvd6cMzbcm2g+FbX92NYrItOd
	GcTOJABcd3TcDljj+qWNoesLmjIltwuPxaA8Gx7nsmm5xCR+A8htMA6jHs4ubYyG9931F8MTmim
	T96IQjcxRTwCQ==
X-Received: by 2002:a17:90a:dfd0:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39b260de667mr31897898a91.4.1788762575676;
        Sun, 06 Sep 2026 23:29:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33450e140d3sm20423987eec.4.2026.09.06.23.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:29:35 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: fix repeated words in log messages
Date: Mon,  7 Sep 2026 11:59:30 +0530
Message-ID: <20260907062930.18120-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop the words written twice, reported by checkpatch.pl as a possible
repeated word.

Only the message text changes, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/soundwire/stream.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index f106a877d7b2..0b00fcdcab2d 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1571,7 +1571,7 @@ int sdw_prepare_stream(struct sdw_stream_runtime *stream)
 	if (stream->state != SDW_STREAM_CONFIGURED &&
 	    stream->state != SDW_STREAM_DEPREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
@@ -1655,7 +1655,7 @@ int sdw_enable_stream(struct sdw_stream_runtime *stream)
 
 	if (stream->state != SDW_STREAM_PREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
@@ -1742,7 +1742,7 @@ int sdw_disable_stream(struct sdw_stream_runtime *stream)
 	}
 
 	if (stream->state != SDW_STREAM_ENABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
@@ -1848,7 +1848,7 @@ int sdw_deprepare_stream(struct sdw_stream_runtime *stream)
 
 	if (stream->state != SDW_STREAM_PREPARED &&
 	    stream->state != SDW_STREAM_DISABLED) {
-		pr_err("%s: %s: inconsistent state state %d\n",
+		pr_err("%s: %s: inconsistent state %d\n",
 		       __func__, stream->name, stream->state);
 		ret = -EINVAL;
 		goto state_err;
-- 
2.48.1

