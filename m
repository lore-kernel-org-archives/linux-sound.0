From: Darcy Parker <parkerd@home.com>
Date: Wed, 21 Apr 1999 07:00:39 +0000
Subject: Re: why no midi?
Message-Id: <marc-linux-sound-92467860312513@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92467332609462@msgid-missing>
In-Reply-To: <marc-linux-sound-92467332609462@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

did you do the following?
chmod a+rw midi*
if you didn't do this you should also do
chmod a+rw dsp*
chmod a+rw audio*
chmod a+rw mixer*
chmod a+rw sndstat
chmod a+rw sequencer
(as root or su of course)
--
*******************************************
Darcy Parker                     
Mechanical Engineering           
Computer Aided Automation Option 
University of British Columbia      
*******************************************
