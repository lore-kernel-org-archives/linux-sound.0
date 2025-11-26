Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C63054C4;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168850; cv=none; b=n6I7qaRnOoRPI2MXZlPc5+CaIYN41aGl5y8kBqbAu6ygaMXmVJ7cBpMLrvV9On9ZkuQy3O5cGj8zY9Qfjp7aYliGOXuE77YV9xfoGhAm8WXhyiroh1QID8MlYFEJgK+cD4EfY/JhazaRWggU7e+QO36itxUgU6Yn4R1zifRWZBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168850; c=relaxed/simple;
	bh=AZWuXSc30esnVPdOkSeXlsCxSpl4Af4MTwmXb70XTOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qBNvCBMgjzqcY5mj5qfrWas5XQcc5IiSCrMCX4yAeVj5rXOvh4tBakp1j8h9l/KZ7zTS1vv3EKDvNIiirm6QKzq07qS8YvARxr6NIR8/vgmac1SeIqMmzUPyRpI5nh2xnliuzwnCL1wqt4GIs9aBO7opZnPJy1wbqZipbm3K5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ns1+yJCg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ns1+yJCg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D195C2BC86;
	Wed, 26 Nov 2025 14:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168850;
	bh=AZWuXSc30esnVPdOkSeXlsCxSpl4Af4MTwmXb70XTOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ns1+yJCg4In+bqecbAcMXifS1Bc/g0EtMZj7k7f1znB46ZtI554hdH05gm9IC3ldx
	 Jmv6dt/yF0sQGMOdjssEI1bNiJ2JNMNwXKGtBq4wnJoXx6zk5v+AjXoO0hvwcu0Z53
	 2QHFeT9LBZ3upnP8JJYDN+tvxxJPRtUWffnaKy3ld4HgPVDM7uiA3wMbypVaXHfHyG
	 6Rrz+oDu4f51R7ObYLQ48UjCEbXEOdN9y+3s3vH2NJgtc//N+n1HjP/Gt2AePxH/z/
	 0WUqiELT2CR+auoxCa5TO03UNotmuwsAesFItrBICRYl3lRdugEmXN7zIeOv6daL17
	 n0LA1Rdl1vRsw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vOGuJ-000000001K6-2iVt;
	Wed, 26 Nov 2025 15:54:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 4/6] slimbus: core: amend slim_get_device() kernel doc
Date: Wed, 26 Nov 2025 15:53:27 +0100
Message-ID: <20251126145329.5022-5-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251126145329.5022-1-johan@kernel.org>
References: <20251126145329.5022-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a comment to clarify that slim_get_device() takes a reference to
the embedded struct device of the returned slimbus device.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/slimbus/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/slimbus/core.c b/drivers/slimbus/core.c
index b4ab9a5d44b3..9402950e7ebd 100644
--- a/drivers/slimbus/core.c
+++ b/drivers/slimbus/core.c
@@ -366,6 +366,9 @@ static struct slim_device *find_slim_device(struct slim_controller *ctrl,
  * @ctrl: Controller on which this device will be added/queried
  * @e_addr: Enumeration address of the device to be queried
  *
+ * Takes a reference to the embedded struct device which needs to be dropped
+ * after use.
+ *
  * Return: pointer to a device if it has already reported. Creates a new
  * device and returns pointer to it if the device has not yet enumerated.
  */
-- 
2.51.2

